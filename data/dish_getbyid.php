<?php
header('Content-Type:application/json');

@$id = $_REQUEST['id'];
if(empty($id))
{
  echo '[]';
  return;
}

$conn =
mysqli_connect('127.0.0.1','root','','kaifanla');
mysqli_query($conn,'set names utf8');

//从kf_dish表中去查询数据
$sql = "select img_lg,detail,did,name,price,material from kf_dish where did=$id";
$result = mysqli_query($conn,$sql);

$row = mysqli_fetch_assoc($result);
if(empty($row))
{
  echo '[]';
}
else
{
  echo json_encode($row);
}


?>