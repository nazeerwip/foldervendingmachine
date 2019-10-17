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
        <script src="${pageContext.request.contextPath}/js/angular.min.js"></script>
        <link href="${pageContext.request.contextPath}/css/layout.css" rel="stylesheet">
        <script src="${pageContext.request.contextPath}/js/ui-bootstrap-tpls-2.2.0.min.js"></script>
        <script src="${pageContext.request.contextPath}/js/adminApp.js"></script>
        <script src="${pageContext.request.contextPath}/js/adminCtrl.js"></script>
        <link href="${pageContext.request.contextPath}/css/xeditable.css" rel="stylesheet">
        <script src="${pageContext.request.contextPath}/js/xeditable.js"></script>
        <!-- SWC Icon -->
        <link rel="shortcut icon" href="${pageContext.request.contextPath}/img/icon.png">
    </head>
    <body>
        <div class="container">
            <div ng-app="adminApp" ng-controller="adminController">
                <div class="row">
                    <div class="col-md-offset-2 col-md-6">
                        <div class="row item-search">
                            <div class="col-sm-6">
                                <a class="btn btn-default"  href="${pageContext.request.contextPath}/machine"><span class="glyphicon glyphicon-arrow-left" aria-hidden="true"></span> Vending Machine</a>
                            </div>
                            <div class="col-sm-6">
                                <div class="input-group">
                                    <input type="text" class="pull-right form-control" placeholder="Search..." ng-model="searchItems">
                                    <div class="input-group-addon"><span class="glyphicon glyphicon-search"></span></div>
                                </div>
                            </div>
                        </div>
                        <table class="table table-hover item-table">
                            <thead>
                            <th> 
                                <a width="40%" ng-click="orderByMe('name')">
                                    Name 
                                    <span ng-show="myOrderBy == 'name' && !sortReverse" class="glyphicon glyphicon-triangle-bottom"></span>
                                    <span ng-show="myOrderBy == 'name' && sortReverse" class="glyphicon glyphicon-triangle-top"></span>
                                </a>
                            </th>
                            <th>
                                <a width="20%" ng-click="orderByMe('cost')">
                                    Cost
                                    <span ng-show="myOrderBy == 'cost' && !sortReverse" class="glyphicon glyphicon-triangle-bottom"></span>
                                    <span ng-show="myOrderBy == 'cost' && sortReverse" class="glyphicon glyphicon-triangle-top"></span>
                                </a>
                            </th>
                            <th>
                                <a width="20%" ng-click="orderByMe('quantity')">
                                    Quantity
                                    <span ng-show="myOrderBy == 'quantity' && !sortReverse" class="glyphicon glyphicon-triangle-bottom"></span>
                                    <span ng-show="myOrderBy == 'quantity' && sortReverse" class="glyphicon glyphicon-triangle-top"></span>
                                </a>
                            </th>
                            <th width="20%"></th>
                            </thead>
                            <tbody>
                                <tr ng-repeat="item in items| filter:searchItems | orderBy:myOrderBy:sortReverse">
                                    <td>
                                        <span editable-text="item.name" e-name="name" e-form="rowform" 
                                              onbeforesave="checkName($data)">
                                            {{ item.name || 'Empty' }}
                                        </span>
                                    </td>
                                    <td>
                                        <span editable-number="item.cost" e-step=".05" e-name="cost" 
                                              e-form="rowform" onbeforesave="checkCost($data)">
                                            {{ item.cost | currency }}
                                        </span>

                                    </td>
                                    <td>
                                        <span editable-number="item.quantity" e-step="1" e-name="quantity" 
                                              e-form="rowform" onbeforesave="checkQuantity($data)">
                                            {{ item.quantity || 'Empty' }}
                                        </span>

                                    </td>
                                    <td style="white-space: nowrap">
                                        <!-- form -->
                                        <form editable-form name="rowform" onbeforesave="updateItem($data, item.id)" ng-show="rowform.$visible" class="form-buttons form-inline" shown="inserted == item">
                                            <button type="submit" ng-disabled="rowform.$waiting" class="btn btn-primary">
                                                save
                                            </button>
                                            <button type="button" ng-disabled="rowform.$waiting" ng-click="rowform.$cancel()" class="btn btn-default">
                                                cancel
                                            </button>
                                        </form>
                                        <div class="buttons" ng-show="!rowform.$visible">
                                            <button type="button" class="btn btn-primary" ng-click="rowform.$show()">edit</button>
                                            <button type="button" class="btn btn-danger" ng-click="deleteItem(item.id)">del</button>
                                        </div>  
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                            <button type="button" class="btn btn-default" ng-click="addItem()"><span class="glyphicon glyphicon-plus"></span>Add item</button>

                        <div class="alert alert-danger" ng-hide="errorDiv">
                            <div ng-repeat="error in validationErrors">
                                <p> {{ error.message}} </p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>         
        </div>
    </div>

    <script src="${pageContext.request.contextPath}/js/jquery-2.2.4.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
</body>
</html>

