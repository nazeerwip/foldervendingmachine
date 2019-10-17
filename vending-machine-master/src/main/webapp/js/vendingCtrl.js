/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

app.run(function (editableOptions) {
    editableOptions.theme = 'bs3'; // bootstrap3 theme. Can be also 'bs2', 'default'
});

app.controller('vendingController', function ($scope, $http, $filter, $timeout) {
    $scope.credit = 0;
    $scope.status = "";
    $scope.location = ["A1", "A2", "A3", "B1", "B2", "B3", "C1", "C2",
        "C3", "D1", "D2", "D3"];
    $http.get("allitems")
            .then(function (response) {
                $scope.items = response.data;
            });
    // called by the machine when coins are accepted
    $scope.insertCoin = function (value) {
        $scope.credit += value;
    }
    $scope.selectSlot = function (slot) {

        var price = getSlotPrice(slot);
        if (!hasSufficientCredit(price))
            return;
        if (!dispenseProduct(slot))
            return;
        decrementCredit(price);
        showVendItem(slot);
        flashStatus("Enjoy!");
    }

    $scope.dispenseChange = function () {
        $scope.credit = 0;
    }

    $scope.removeVendedItem = function () {
        $scope.vendItem = true;
        $timeout(function () {
            $scope.vendItemDoor = false;
        }, 2000).then(function () {
            $timeout(function () {
                $scope.vendItem = false;
            }, 1000);
        });


    }

    function getSlotPrice(slot) {
        var list = $scope.items;
        var price = list[slot].cost;
//                        console.log(price);
        return price;
    }

    function hasSufficientCredit(price) {
        if ($scope.credit >= price)
            return true;
        flashPrice(price);
        return false;
    }

    function dispenseProduct(slot) {
        var list = $scope.items;

        console.log(list[slot]);

        if (list[slot].quantity < 1) {
            flashStatus("Empty");
            return false;
        }

        list[slot].quantity -= 1;

        console.log(list[slot].quantity);

        $http.put("item/" + list[slot].id, list[slot])
                .then(
                        function (response) {
                            return true;
                        },
                        function (response) {
                            return false;
                        }
                );

        return true;
    }

    function showVendItem(slot) {
        $scope.vendItemName = $scope.items[slot].name;
        $scope.vendItemDoor = true;
//                       
    }





    function decrementCredit(value) {
        console.log("minus credit");
        $scope.credit -= value;
    }
    function flashPrice(price) {
        flashStatus($filter('currency')(price));
    }

    function flashStatus(message) {
        $scope.status = message;
        $timeout(function () {
            $scope.status = "";
        }, 1000);
    }
});

