<?php
header('Content-Type:application/json');

//解析客户端所发来的参数
//uName\uAddr\uPhone\uSex\did
@$name = $_REQUEST['uName'];
@$addr = $_REQUEST['uAddr'];
@$phone = $_REQUEST['uPhone'];
@$sex = $_REQUEST['uSex'];
@$did = $_REQUEST['did'];

//判断只要有一个空，直接返回
if(empty($name) || empty($addr) || empty($phone)|| empty($sex) || empty($did))
{
  echo '[]';
  return;
}
//定一个变量用来保存当前的时间戳
$order_time = time()*1000;




$conn =
mysqli_connect('127.0.0.1','root','','kaifanla');
mysqli_query($conn,'set names utf8');
//从kf_dish表中去查询数据
$sql = "insert into kf_order values(null,'$phone','$name',$sex,'$order_time','$addr',$did)";
$result = mysqli_query($conn,$sql);
$output = [];
if($result)
{
  $output['oid'] = mysqli_insert_id( $conn );
  $output['msg'] = 'succ';
}
else
{
  $output['msg'] = 'error';
}
echo json_encode($output);

?>