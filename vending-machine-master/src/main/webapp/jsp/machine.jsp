<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
        <title>Vending Machine App</title>
        <!-- Bootstrap core CSS -->
        <link href="${pageContext.request.contextPath}/css/bootstrap.min.css" rel="stylesheet">
        <link href="https://fonts.googleapis.com/css?family=Roboto|VT323" rel="stylesheet">
        <link href="${pageContext.request.contextPath}/css/layout.css" rel="stylesheet">
        <script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.4.8/angular.min.js"></script>
        <script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.4.8/angular-animate.js"></script>
        <script src="${pageContext.request.contextPath}/js/myApp.js"></script>
        <script src="${pageContext.request.contextPath}/js/vendingCtrl.js"></script>
         <link href="${pageContext.request.contextPath}/css/xeditable.css" rel="stylesheet">
        <script src="${pageContext.request.contextPath}/js/xeditable.js"></script>
        <!-- SWC Icon -->
        <link rel="shortcut icon" href="${pageContext.request.contextPath}/img/icon.png">
    </head>
    <body> 
        <div class="container">
            <div ng-app="myApp" ng-controller="vendingController"> 
                <div class="row whole-machine">
                    <div class="col-sm-offset-2 col-sm-6 machine">
                        <div ng-repeat="item in items | limitTo:12">
                            <div class="clearfix" ng-if="$index % 3 == 0"></div>
                            <div class="shelf" ng-if="$index % 3 == 0 && $index != 0"></div>
                            <div class="col-xs-4">
                                <div ng-class="{'item-style-out': item.quantity === 0, 'item-style': item.quantity > 0}" class="text-center">{{ item.name}}<p>{{  item.quantity }}</div>
                                <div class="item-price">
                                    <span> {{ location[$index] }} </span>
                                    <span class="pull-right">{{ item.cost | currency }} </span>
                                </div>
                            </div>
                            <div class="clearfix" ng-if="$last"></div>
                            <div class="shelf" ng-if="$last"></div>
                        </div>
                        
                    </div>
                    <div class="col-sm-4 machine-input">
                        <div class="row">
                            <div class="btn-group" role="group" aria-label="...">
                                <button type="button" class="btn btn-default" ng-click="insertCoin(1)">$1.00</button>
                                <button type="button" class="btn btn-default" ng-click="insertCoin(.25)">25&cent;</button>
                                <button type="button" class="btn btn-default" ng-click="insertCoin(.10)">10&cent;</button>
                                <button type="button" class="btn btn-default" ng-click="insertCoin(.05)">5&cent;</button>
                            </div>
                        </div>
                        <div class="row">
                            <div class="form-group">
                                <div class="col-xs-6">
                                    <input type="text" class="change-input form-control" readonly value="{{ credit| currency }}"></input>
                                </div>
                                <div class="col-xs-6">
                                    <input type="text" class="change-input form-control" readonly value="{{ status}}"></input>
                                </div>
                                
                            </div>
                        </div>
                        <div class="row">
                            <div class="btn-toolbar" role="toolbar" aria-label="">
                                <div class="btn-group" role="group">
                                    <button type="button" class="btn btn-default change-button" ng-click="dispenseChange()">Change</button>
                                </div>
                                <div class="btn-group" role="group" aria-label="">
                                    <button type="button" class="btn btn-default btn-lg" ng-click="selectSlot(0)">A1</button>
                                    <button type="button" class="btn btn-default btn-lg" ng-click="selectSlot(1)">A2</button>
                                    <button type="button" class="btn btn-default btn-lg" ng-click="selectSlot(2)">A3</button>
                                </div>
                                <div class="btn-group" role="group" aria-label="">
                                    <button type="button" class="btn btn-default btn-lg" ng-click="selectSlot(3)">B1</button>
                                    <button type="button" class="btn btn-default btn-lg" ng-click="selectSlot(4)">B2</button>
                                    <button type="button" class="btn btn-default btn-lg" ng-click="selectSlot(5)">B3</button>
                                </div>
                                <div class="btn-group" role="group" aria-label="">
                                    <button type="button" class="btn btn-default btn-lg" ng-click="selectSlot(6)">C1</button>
                                    <button type="button" class="btn btn-default btn-lg" ng-click="selectSlot(7)">C2</button>
                                    <button type="button" class="btn btn-default btn-lg" ng-click="selectSlot(8)">C3</button>
                                </div>
                                <div class="btn-group" role="group" aria-label="">
                                    <button type="button" class="btn btn-default btn-lg" ng-click="selectSlot(9)">D1</button>
                                    <button type="button" class="btn btn-default btn-lg" ng-click="selectSlot(10)">D2</button>
                                    <button type="button" class="btn btn-default btn-lg" ng-click="selectSlot(11)">D3</button>
                                </div>
                                
                            </div>
                        </div>
                        <div class="row vend-door-black">
                            <div ng-hide="vendItemDoor" class="vend-door"></div>
                            <div ng-hide="vendItem" class="item-style-vend text-center" ng-click="removeVendedItem()">{{ vendItemName }}</div>
                            
                        </div>
                        <div class="row myrow">
                            <a class="btn btn-default service-button"  href="${pageContext.request.contextPath}/home"><span class="glyphicon glyphicon-cog" style="font-size: large" aria-hidden="true"></span></a>
                        </div>
                    </div>
                    
                </div>
            </div>
            <script src="${pageContext.request.contextPath}/js/jquery-2.2.4.min.js"></script>
            <script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
    </body>
</html>

