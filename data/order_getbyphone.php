<?php
header('Content-Type:application/json');

@$phone = $_REQUEST['phone'];
if(empty($phone)){
  echo '[]';
  return ;
}

$conn =
mysqli_connect('127.0.0.1','root','','kaifanla');
mysqli_query($conn,'set names utf8');
//从kf_dish表中去查询数据
$sql = "select kf_order.oid,kf_order.did,kf_order.order_time,kf_order.phone,kf_dish.img_sm from kf_order,kf_dish where kf_order.phone=$phone and kf_order.did=kf_dish.did";

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