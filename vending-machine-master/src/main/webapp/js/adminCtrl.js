/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */


app.run(function (editableOptions) {
    editableOptions.theme = 'bs3'; 
});
app.controller('adminController', function ($scope, $http, $filter) {

    $scope.errorDiv = true;
    $scope.sortReverse = false;
    loadItems();

    $scope.deleteItem = function (id) {
        var answer = confirm("Do you really want to delete this item?");

        if (answer === true) {
            $http.delete("item/" + id)
                    .then(function (response) {
                        loadItems();
                    });
        }
    };

    $scope.updateItem = function (item, id) {
        console.log("update item");
        if (id === undefined) {
            $http.post("item", item)
                    .then(function (response) {
                        $scope.errorDiv = true;
                        loadItems();
                    },
                            function (response) {
                                $scope.errorDiv = false;

                                $scope.validationErrors = response.data.fieldErrors;

                                console.log($scope.validationErrors);
                            }
                    );
        } else {
            $http.put("item/" + id, item)
                    .then(
                            function (response) {
                                console.log("success");
                                $scope.errorDiv = true;
                            },
                            function (response) {
                                $scope.errorDiv = false;

                                $scope.validationErrors = response.data.fieldErrors;

                                console.log($scope.validationErrors);
                            }
                    );
        }
    };

    $scope.addItem = function () {
        $scope.inserted = {
            name: '',
            cost: '',
            quantity: ''
        };

        $scope.items.push($scope.inserted);
        console.log("inserted");

    };

    $scope.cancel = function () {
        console.log("cancel button works");
    };

    $scope.orderByMe = function (x) {
        $scope.myOrderBy = x;
        $scope.sortReverse = !$scope.sortReverse;
    };

    $scope.checkName = function (data) {
        if (data === '') {
            return "Name can't be empty";
        }
    };

    $scope.checkCost = function (data) {
        if (data > 20 || data < 0) {
            return "Cost must be between $0 and $20";
        }
    };

    $scope.checkQuantity = function (data) {
        if (data > 50) {
            return "This machine can only hold 50 items";
        }
        if (data < 0) {
            return "Can't have negative inventory";
        }
    };

    function loadItems() {
        $http.get("allitems")
                .then(function (response) {
                    $scope.items = response.data;
                });
    }
});

