<!doctype html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <title>{{$title}} | {{ app_name() }}</title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta content="{{description()}}" name="description">
        <meta content="Themesbrand" name="author">
        <!-- App favicon -->
        <link rel="shortcut icon" href="{{ asset('/site_data_images') }}/{{ get_icon() }}">

        <!-- Bootstrap Css -->
        <link href="{{ asset('dashboard_assets/css/bootstrap.min.css') }}" id="bootstrap-style" rel="stylesheet" type="text/css">
        <!-- Icons Css -->
        <link href="{{ asset('dashboard_assets/css/icons.min.css') }}" rel="stylesheet" type="text/css">
        <!-- App Css-->
        <link href="{{ asset('dashboard_assets/css/app.min.css') }}" id="app-style" rel="stylesheet" type="text/css">

        <style>
            @media (max-width: 500px) {
                .account-page-full { 
                    width: 100%!important; 
                }
            }
        </style>
    </head>

<body>