<?php
header('Content-Type:application/json');

@$start = $_REQUEST['start'];
$count = 5;

$conn =
mysqli_connect('127.0.0.1','root','','kaifanla');
mysqli_query($conn,'set names utf8');
//从kf_dish表中去查询数据
$sql = "select img_sm,did,name,price,material from kf_dish limit $start,$count";
$result = mysqli_query($conn,$sql);
$output = [];
while(true)
{
  //考虑到第版本的php 也可以fetch_all
  $row = mysqli_fetch_assoc($result);
  if(!$row)
  {
   break;
  }
  $output[] = $row;
}

echo json_encode($output);

?>