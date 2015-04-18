(function() {
  "use strict";
  angular.module("app").controller("patientCtrl", function($scope, $http){




    $scope.setup = function() {
          $http.get("/api/v1/cancers.json").then(function (response) {
            $scope.cancers = response.data["cancers"];
          });
        };

    $scope.autocompleteCancer = function(text) {
      $http.get("/api/v1/cancers/search.json?cancer.type_of_cancer_id=" + text).then(function (response) {
        console.log(response);
        $scope.autocompleteCancer = response.data;
      });
    };
    



  // do not delete below here
  });
}());