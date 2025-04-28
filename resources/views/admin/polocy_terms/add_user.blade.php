<!-- adding header -->
@include("admin/dash/header")
<!-- end header -->

            <!-- ========== Left Sidebar Start ========== -->
            @include("admin/dash/left_side_bar")
            <!-- Left Sidebar End -->

            <div class="main-content">

                <div class="page-content">
                    <div class="container-fluid">

                        <!-- start page title -->
                        <div class="page-title-box">
                            <div class="row align-items-center">
                                <div class="col-md-8">
                                    <h6 class="page-title">Customer</h6>
                                    <ol class="breadcrumb m-0">
                                        <li class="breadcrumb-item"><a href="{{ route('dashboard') }}">Home</a></li>
                                        <li class="breadcrumb-item"><a href="{{ route('customer') }}">Customer</a></li>
                                        <li class="breadcrumb-item active" aria-current="page">Add Customer</li>
                                    </ol>
                                </div>
                                <div class="col-md-4">
                                    <div class="float-end d-none d-md-block">
                                        <div class="dropdown">
                                            <a href="{{ route('customer') }}" class="btn btn-primary  dropdown-toggle" aria-expanded="false">
                                                <i class="fas fa-arrow-left me-2"></i> Back
                                            </a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!-- end page title -->
                        <!-- register -->
                        <div class="account-pages pt-2">
                            <div class="container">
                                <div class="row justify-content-center">
                                    <div class="col-md-8 col-lg-12">
                                        <form class="custom-validation" action="{{ route('customer.process') }}" method="post" enctype="multipart/form-data">
                                            @csrf
                                            <div class="row">
                                                <div class="col-lg-12">
                                                    <div class="card">
                                                        <div class="card-header bg-primary text-light">
                                                            Add Customer
                                                        </div>
                                                        <div class="card-body">
                                                            <div class="row">
                                                                <div class="col-md-4 mb-3">
                                                                    <label for="name" class="form-label">Full Name</label>
                                                                    <input type="text" class="form-control" name="name" id="name" placeholder="Name" required>
                                                                    <span class="text-danger">@error('name'){{$message}}@enderror</span>
                                                                    <div class="invalid-feedback">
                                                                        This field is required
                                                                    </div>
                                                                </div>
                                                                <div class="col-md-4">
                                                                    <label for="phone" class="form-label">Contact No.</label>

                                                                    <div class="input-group has-validation">
                                                                        <span class="input-group-text" id="phone"><i class="fas fa-phone"></i></span>
                                                                        <input type="number" class="form-control" name="phone" id="phone" aria-describedby="inputGroupPrepend" required>
                                                                    </div><span class="text-danger">@error('phone'){{$message}}@enderror</span>
                                                                    <div class="invalid-feedback">
                                                                        This field is required
                                                                    </div>
                                                                </div>
                                                                <div class="col-md-4">
                                                                    <label for="email" class="form-label">Date of Birth</label>
                                                                    <div class="input-group" id="datepicker2">
                                                                        <input type="text" class="form-control" placeholder="dd M, yyyy" name="dob"
                                                                            data-date-format="dd M, yyyy" data-date-container='#datepicker2' data-provide="datepicker"
                                                                            data-date-autoclose="true">

                                                                        <span class="input-group-text"><i class="mdi mdi-calendar"></i></span>
                                                                    </div>
                                                                    <span class="text-danger">@error('dob'){{$message}}@enderror</span>
                                                                </div>
                                                                <div class="col-md-4">
                                                                    <label for="gender" class="form-label">Gender</label>
                                                                    <select class="form-select select2" id="gender" name="gender" required="">
                                                                        <option selected="" disabled=""  value="">Choose...</option>
                                                                        <option value="Male">Male</option>
                                                                        <option value="Female">Female</option>
                                                                    </select><span class="text-danger">@error('gender'){{$message}}@enderror</span>
                                                                    {{-- @error('gender') is-invalid @enderror" --}}
                                                                    <div class="invalid-feedback">
                                                                        Please select a valid state.
                                                                    </div>
                                                                </div>
                                                                <div class="mb-3 col-md-4">
                                                                    <label class="form-label mb-3 d-flex">Status</label>
                                                                    <input class="form-check form-switch" type="checkbox" name="status" id="switch3" value="1" switch="bool" checked>
                                                                    <label class="form-label" for="switch3" data-on-label="Active" data-off-label="Inactive"></label>
                                                                </div><span class="text-danger">@error('status'){{$message}}@enderror</span>
                                                                <div class="mb-0">
                                                                    <div>
                                                                        <button type="submit" class="btn btn-primary waves-effect waves-light me-1">
                                                                            Save & Publish
                                                                        </button>
                                                                        <button type="reset" class="btn btn-secondary waves-effect">
                                                                            Reset
                                                                        </button>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <!-- end col -->
                                            </div>
                                            <!-- end row -->
                                        </form>
                                    </div>
                                </div>
                            </div>
                        </div>



                        <!-- end register -->

                    </div> <!-- container-fluid -->
                </div>
                <!-- End Page-content -->

                @include("admin/dash/footer")
