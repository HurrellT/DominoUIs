"se strict";

var app = angular.module('chooseSizeModule', []);

app.controller('ChooseSizeCtrl', function ($scope) {

    $scope.sizes = [
        {
            "name": "Una porción",
            "price": "$12,5"
        },
        {
            "name": "Grande",
            "price": "$50"
        },
        {
            "name": "Chica",
            "price": "$100"
        },
        {
            "name": "Familiar",
            "price": "$125"
        }
    ];

});