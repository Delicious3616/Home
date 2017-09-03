/**
 * Created by bjwsl-001 on 2017/8/30.
 */

/*
 * 创建SPA的基本步骤：
 * ①引入对应的js文件
 * ②创建模块指定依赖ng ngRoute
 * ③ngView
 * ④创建代码片段
 * ⑤配置路由词典
 * */

var app = angular.module('kflModule',
  ['ng', 'ngRoute']);

app.config(function ($routeProvider) {
  $routeProvider
       .when('/kflMain', {
      templateUrl: 'tpl/main.html',
      controller: 'mainCtrl'
    })
       .when("/shareDetail/:id",{
        templateUrl:'tpl/shareDetail.html',
        controller:'shareDetail'
       })
    .otherwise({redirectTo: '/kflMain'})
      })
    

app.controller('bodyCtrl',
  ['$scope', '$location',
    function ($scope, $location) {
      $scope.jump = function (destPath) {
        $location.path(destPath);
      }

    }])

//给main页面指定一个控制器
app.controller('mainCtrl', ['$scope', '$http', function ($scope, $http) {
    $scope.dishList = [];
    $scope.hasMore = true;
    $scope.myInput = "";
    //发起网络请求获取数据
    $http
      .get('data/dish_getbypage.php?start=0')
      .success(function (data) {
        console.log(data);
        $scope.dishList = data;
      })

    //给button定义加载更多的方法
    $scope.loadMore = function () {
      $http
        .get('data/dish_getbypage.php?start=' + $scope.dishList.length)
        .success(function (data) {

          if (data.length < 5) {
            $scope.hasMore = false;
          }

          //将加载更多来的数据（数组）和之前的dishList拼接
          $scope.dishList =
            $scope.dishList.concat(data);
        })
    }

    //监听myInput数据的变化，只要发生变化就进行搜索
    $scope.$watch('myInput', function () {
        //发起网络请求
        if ($scope.myInput.length > 0) {
          $http
            .get('data/dish_getbykw.php?kw=' + $scope.myInput)
            .success(function (data) {
              console.log(data);
              //如何将搜索到的结果显示在main的列表中？
              //main列表背后的数组：dishList
              if(data.length>0)
              {
                $scope.dishList = data;
              }
            })
        }
      }
    )
  }
  ]
)
app.controller("shareDetail",["$scope","$http","$routeParams",function($scope, $http,$routeParams){
    console.log($routeParams);
    $http.get('data/dish_getbyid.php?id='+$routeParams.id)
    .success(function(data){
      $scope.dish=data;
    })

}])










