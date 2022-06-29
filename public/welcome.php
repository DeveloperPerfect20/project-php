<?php 
session_start();
if(isset($_SESSION['email'])){
include('./header.php');
include_once ('../private/conn.php');
$id = $_SESSION['id'];

if($_SERVER['REQUEST_METHOD'] == 'POST' && isset($_POST['text'])){
    $text = mysqli_real_escape_string($conn,$_POST['text']) ;
    $error = [];

if(!$text){
    $errors[] = 'Text is required';
} 
if (empty( $_FILES["picture"]["name"])) {
    $errors[] = 'Picture is required';
} 

if(strlen($text) < 10){
    $errors[] = 'Text need to have a minimum of 10 letters';
}
if(!isset($errors)){
    $image = $_FILES['picture']['name'];
    $image_size = $_FILES['picture']['size'];
    $image_error = $_FILES['picture']['error'];
    $file = explode('.',$image);
    $fileActual = strtolower(end($file));
    $allowed = array('png','jpg','jpge','svg');
    if(in_array($fileActual,$allowed)){
        if($image_error === 0){
            if($image_size < 4000000){
                    $image_new_name = uniqid('',true).'-'.$image;
                    $target = '../private/posts_picture/'.$image_new_name;
                    $create_at = date('Y-m-d H:i:s');
                    $sql = "INSERT INTO posts (text,picture,user_id,create_at) VALUES ('$text','$image_new_name','$id','$create_at')";
                    if(!empty($image)){
                        mysqli_query($conn,$sql);
                        if(move_uploaded_file($_FILES['picture']['tmp_name'],$target)){
                            header('location:welcome.php');
                        }
                    } 
                }else{
                $errors[] = 'Your picture is to Big';
            }
    
            }
    
        }else{
            $errors[] = 'Check picture type';
        }
}

}
?>

<head>
<link rel="stylesheet" href="../css/style.css" >
</head>

<div class="container">
<br><a class="btn btn-warning" href="#posts" >Add post</a><br><br>
<?php if(!empty($errors)): ?>

<div class="alert bg-primary">
<?php 
foreach($errors as $error): 
?>
    <div><?php echo '- '.$error ;?></div>

<?php endforeach ?>
</div>

<?php endif; ?> 

<?php


$user_info = mysqli_query($conn,"SELECT * FROM `posts`");
while($data = mysqli_fetch_array($user_info)){
    $user_id = $data['user_id'];
    $post_id = $data["post_id"];
    echo '<form method="post" action=""><input type="hidden" name="get_id_post" value="'.$data["post_id"].'">';
echo "<img src='../private/posts_picture/".$data['picture']."'' width='300px'  class='rounded' >";
echo '<p><br>'.$data['text'].'</p>
<p  style="color:grey">'.$data['create_at'].'</p>';
$user = mysqli_query($conn,"SELECT * FROM `users` WHERE id='$user_id'");
while($data_user= mysqli_fetch_array($user)){
    echo '<p class="btn btn-success">'.$data_user['username'].'<p>';
}
?>
<?php 
$check = mysqli_query($conn,"SELECT * FROM `comments` WHERE post_id='$post_id'");
if(mysqli_num_rows($check) < 1){
echo '<div class="alert bg-primary" role="alert"> No comment</div>';
}else{
echo '<h3>Comments</h3>';
$user_comment = mysqli_query($conn,"SELECT * FROM `comments` WHERE post_id='$post_id'");
while($data = mysqli_fetch_array($user_comment)){
    $id_user = $data['user_id'];
echo '<div class="card" style="width: 30rem;">
<ul class="list-group list-group-flush">
  <li class="list-group-item" >	'.$data['text'];
  $find_user = mysqli_query($conn,"SELECT * FROM `users` WHERE id='$id_user'");
  while($data = mysqli_fetch_array($find_user)){
      echo '<span dir="ltr">	&nbsp; | '.$data['username'].' </span></li>';
  }

echo '</ul>
</div>';
}
}

?>

<?php

echo '<details><summary class="text-primary">Drop Comment</summary><div class="mb-3">

<textarea name="comment_text" class="form-control" id="exampleFormControlTextarea1" rows="3" value=""></textarea>
';
    echo '<br><button name="comment" type="submit" class="btn btn-primary">Drop Comment</button></div></details></form><hr>';
    
}

if(isset($_POST['get_id_post'])){
    $get_id_post = $_POST['get_id_post']; 
}

if(isset($_POST['comment'])){
    $comment_text = $_POST['comment_text'];

if(!isset($comment_text) || $comment_text == ''){
    exit();
}



$create_at = date('Y-m-d H:i:s');
$sql = "INSERT INTO comments (text,created_at,user_id,post_id) 
VALUES ('$comment_text','$create_at','$id','$get_id_post')";
mysqli_query($conn,$sql);
echo ' <meta http-equiv="Refresh" content="0; url=welcome.php">';
//header('location:welcome.php');

}

?>
<form action="" method="POST" enctype="multipart/form-data">
<h1 id="posts">Add Posts</h1>
<div class="mb-3">
  <label for="exampleFormControlTextarea1" class="form-label">Text</label>
  <textarea class="form-control" name="text" id="exampleFormControlTextarea1" rows="3"></textarea>
</div>
<input class="form-control" name="picture" type="file" id="formFile">
  <br> <button name="submit" type="submit" class="btn btn-primary">Post</button>
</div>

</form>
<?php
}else{
    header('location:index.php');
}

?>