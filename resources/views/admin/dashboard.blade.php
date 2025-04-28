<!-- adding header -->
@include('admin.dash/header')
<!-- end header -->

<style>
    .mini-stat .mini-stat-img {
        width: 52px !important;
    }
</style>
<!-- ========== Left Sidebar Start ========== -->
@include('admin.dash.left_side_bar')
<!-- Left Sidebar End -->

<div class="main-content">

    <div class="page-content">
        <div class="container-fluid">

            <!-- start page title -->
            <div class="page-title-box">
                <div class="row align-items-center">
                    <div class="col-md-8">
                        <h6 class="page-title">Dashboard</h6>
                        <ol class="breadcrumb m-0">
                            <li class="breadcrumb-item active">Welcome to {{ app_name() }} Dashboard</li>
                        </ol>
                    </div>
                </div>
            </div>
            <!-- end page title -->


            <div class="row">
                <div class="col-xl-3 col-md-6">
                    <div class="card mini-stat bg-primary text-white">
                        <a href="{{ route('customer') }}">
                            <div class="card-body">
                                <div class="mb-4">
                                    <div class="float-start mini-stat-img me-4">
                                        <img src="{{ asset('dashboard_assets/images/services-icon/14.1.png') }}"
                                            alt="">
                                    </div>
                                    <h5 class="font-size-16 text-uppercase text-white-50">Customers</h5>
                                    <h4 class="fw-medium font-size-24" style="color:white;">{{ $customer_count }}</h4>
                                </div>
                            </div>
                        </a>
                    </div>
                </div>
                <div class="col-xl-3 col-md-6">
                    <div class="card mini-stat bg-primary text-white">
                        <a href="{{ route('agent') }}">
                            <div class="card-body">
                                <div class="mb-4">
                                    <div class="float-start mini-stat-img me-4">
                                        <img src="{{ asset('dashboard_assets/images/services-icon/34.png') }}"
                                            alt="">
                                    </div>
                                    <h5 class="font-size-16 text-uppercase text-white-50">Advisor</h5>
                                    <h4 class="fw-medium font-size-24" style="color:white;">{{ $agent_count }}</h4>
                                </div>
                            </div>
                        </a>
                    </div>
                </div> 
                <div class="col-xl-3 col-md-6">
                    <div class="card mini-stat bg-primary text-white">
                        <a href="{{ route('policy') }}">
                            <div class="card-body">
                                <div class="mb-4">
                                    <div class="float-start mini-stat-img me-4">
                                        <img src="{{ asset('dashboard_assets/images/services-icon/36.png') }}"
                                            alt="">
                                    </div>
                                    <h5 class="font-size-16 text-uppercase text-white-50">Policy</h5>
                                    <h4 class="fw-medium font-size-24" style="color:white;">{{ $policy_count }}</h4>
                                </div>
                            </div>
                        </a>
                    </div>
                </div> 
                <div class="col-xl-3 col-md-6">
                    <div class="card mini-stat bg-primary text-white">
                        <a href="{{ route('policy-payment') }}">
                            <div class="card-body">
                                <div class="mb-4">
                                    <div class="float-start mini-stat-img me-4">
                                        <img src="{{ asset('dashboard_assets/images/services-icon/35.png') }}"
                                            alt="">
                                    </div>
                                    <h5 class="font-size-16 text-uppercase text-white-50">{{date('F')}} Recived</h5>
                                    <h4 class="fw-medium font-size-24" style="color:white;">{{ $month_payment }}</h4>
                                </div>
                            </div>
                        </a>
                    </div>
                </div> 
            </div>
        </div>
        <!-- End Page-content -->


        @include('admin/dash/footer')
