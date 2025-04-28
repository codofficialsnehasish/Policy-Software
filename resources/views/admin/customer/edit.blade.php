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
                                        <li class="breadcrumb-item"><a href="{{ route('dashboard') }}">Dashboard</a></li>
                                        <li class="breadcrumb-item"><a href="{{ route('customer') }}">Customer</a></li>
                                        <li class="breadcrumb-item active" aria-current="page">Edit Customer</li>
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
                                        <form class="custom-validation" action="{{ route('customer.update', $customer->id) }}" method="post" enctype="multipart/form-data">
                                            @csrf
                                            <div class="row">
                                                <div class="col-lg-12">
                                                    <div class="card">
                                                        <div class="card-header bg-primary text-light">
                                                            Edit Customer
                                                        </div>
                                                        <div class="card-body">
                                                            <div class="row">
                                                                <div class="col-md-3 mb-3">
                                                                    <label for="name" class="form-label">Customer ID</label>
                                                                    <input type="number" class="form-control" name="customer_id"  id="customer_id" placeholder="Enter Customer ID" value="{{ $customer->customer_id }}" required>
                                                                    <span class="text-danger">@error('customer_id'){{$message}}@enderror</span>
                                                                    <div class="invalid-feedback">
                                                                        This field is required
                                                                    </div>
                                                                </div>
                                                                <div class="col-md-3 mb-3">
                                                                    <label for="name" class="form-label">Full Name</label>
                                                                    <input type="text" class="form-control" name="name" id="name" placeholder="Name"
                                                                    value="{{ $customer->name }}" required>
                                                                    <span class="text-danger">@error('name'){{$message}}@enderror</span>
                                                                    <div class="invalid-feedback">
                                                                        This field is required
                                                                    </div>
                                                                </div>
                                                                <div class="col-md-3 mb-3">
                                                                    <!-- <label for="fathers_name" class="form-label">Fathers/Husbands Name</label> -->
                                                                    <label for="name" class="form-label"><input type="radio" name="father_or_husband" value="1" id="name" required="" {{ $customer->father_or_husband == 1 ? 'checked' : ''}}>Fathers /</label>
                                                                    <label for="names" class="form-label"><input type="radio" name="father_or_husband" value="0" id="names" required="" {{ $customer->father_or_husband == 0 ? 'checked' : ''}}> Husbands Name</label>
                                                                    <input type="text" class="form-control" name="father_or_husbend_name" id="fathers_name" placeholder="Fathers / Husbands Name" value="{{ $customer->father_or_husband_name}}">
                                                                    <div class="invalid-feedback">
                                                                        This field is required
                                                                    </div>
                                                                </div>
                                                                <div class="col-md-3 mb-3">
                                                                    <label for="phone" class="form-label">Contact No.</label>

                                                                    <div class="input-group has-validation">
                                                                        <span class="input-group-text" id="phone"><i class="fas fa-phone"></i></span>
                                                                        <input type="number" class="form-control" name="phone" id="phone" aria-describedby="inputGroupPrepend"
                                                                         value="{{ $customer->phone }}" required>
                                                                    </div><span class="text-danger">@error('phone'){{$message}}@enderror</span>
                                                                    <div class="invalid-feedback">
                                                                        This field is required
                                                                    </div>
                                                                </div>
                                                                <div class="col-md-3 mb-3">
                                                                    <label for="phone" class="form-label">Alternative Contact No.</label>

                                                                    <div class="input-group has-validation">
                                                                        <span class="input-group-text" id="alternative_phone"><i class="fas fa-phone"></i></span>
                                                                        <input type="number" class="form-control" name="alternative_phone" id="alternative_phone" aria-describedby="inputGroupPrepend"
                                                                         value="{{ $customer->alternative_phone }}" required>
                                                                    </div><span class="text-danger">@error('alternative_phone'){{$message}}@enderror</span>
                                                                    <div class="invalid-feedback">
                                                                        This field is required
                                                                    </div>
                                                                </div>
                                                                <div class="col-md-3 mb-3">
                                                                    <label for="email" class="form-label">Date of Birth</label>
                                                                    <div class="input-group" id="datepicker2">
                                                                        <input type="text" class="form-control" placeholder="dd M, yyyy" name="dob" value="{{ $customer->dob }}"
                                                                            data-date-format="dd M, yyyy" data-date-container='#datepicker2' data-provide="datepicker"
                                                                            data-date-autoclose="true">

                                                                        <span class="input-group-text"><i class="mdi mdi-calendar"></i></span>
                                                                    </div>
                                                                    <span class="text-danger">@error('dob'){{$message}}@enderror</span>
                                                                </div>
                                                                <div class="col-md-3 mb-3">
                                                                    <label for="gender" class="form-label">Gender</label>
                                                                    <select class="form-select select2" id="gender" name="gender" required="">
                                                                        <option selected="" disabled=""  value="">Choose...</option>
                                                                        <option value="Male" {{ $customer->gender == 'Male' ? 'selected' : '' }}>Male</option>
                                                                        <option value="Female" {{ $customer->gender == 'Female' ? 'selected' : '' }}>Female</option>
                                                                        <option value="Transgender" {{ $customer->gender == 'Transgender' ? 'selected' : '' }}>Transgender</option>
                                                                    </select><span class="text-danger">@error('gender'){{$message}}@enderror</span>
                                                                    <div class="invalid-feedback">
                                                                        Please select a valid state.
                                                                    </div>
                                                                </div>
                                                                <div class="col-md-3 mb-3">
                                                                    <label for="area_id" class="form-label">Area:</label>
                                                                    <select class="form-select select2" id="area_id" name="area_id" required="">
                                                                        <option selected="" disabled=""  value="">Choose...</option>
                                                                        @foreach($areas as $area)
                                                                        <option value="{{ $area->id }}" {{ $customer->area_id == $area->id ? 'selected' : '' }}>{{ $area->name }}</option>
                                                                    @endforeach
                                                                    </select><span class="text-danger">@error('area_id'){{$message}}@enderror</span>
                                                                    <div class="invalid-feedback">
                                                                        Please select a valid state.
                                                                    </div>
                                                                </div>

                                                                <div class="col-md-3 mb-3">
                                                                    <label for="area_id" class="form-label">Advisor Name:</label>
                                                                    <select class="form-select select2" id="agent_id" name="agent_id" required="">
                                                                        <option selected="" disabled=""  value="">Choose...</option>
                                                                        @foreach($Agent as $area)
                                                                        <option value="{{ $area->id }}" {{ $customer->agent_id == $area->id ? 'selected' : '' }}>{{ $area->name }} - {{ $area->agent_id }}</option>
                                                                        @endforeach
                                                                    </select><span class="text-danger">@error('agent_id'){{$message}}@enderror</span>
                                                                    <div class="invalid-feedback">
                                                                        Please select a valid state.
                                                                    </div>
                                                                </div>

                                                                <div class="col-md-4 mb-3">
                                                                    <label for="remarks" class="form-label">Address</label>
                                                                    <textarea class="form-control" id="remarks" name="address" rows="4" cols="" placeholder="Address">{{ $customer->address }}</textarea>
                                                                    <div class="invalid-feedback">
                                                                        Please enter valid remarks.
                                                                    </div>
                                                                </div>


                                                                <div class="mb-3 col-md-4 mt-2">
                                                                    <label class="form-label d-flex">Status</label>
                                                                    {{-- <input type="hidden" name="status" value="0"> --}}
                                                                    <input class="form-check form-switch" type="checkbox" name="status" id="switch3"  @if ($customer->status==1) checked @endif value="{{ $customer->status }}" switch="bool">
                                                                    {{-- <input class="form-check form-switch" type="checkbox" name="status" id="status3"  @if ($policy_term->status==1) @endif value="1" switch="bool" checked switch="bool" {{ $customer->status ? 'checked' : '' }}> --}}
                                                                    {{-- <input class="form-check form-switch" type="checkbox" name="status" id="switch3" value="1" switch="bool" checked> --}}
                                                                    <label class="form-label" for="switch3" data-on-label="Active" data-off-label="Inactive"></label>
                                                                </div>

                                                                <span class="text-danger">@error('status'){{$message}}@enderror</span>
                                                                <div class="row">
                                                                    <div class="col-6">
                                                                        <div class="mb-3 col-md-6">
                                                                            <label class="fs-6 fw-semibold mb-2">Customer Image</label>
                                                                            <div class="mb-2" id="selectedBanner">
                                                                                <img class="img-thumbnail rounded me-2" id="customer_image" alt="" width="200" src="{{ $customer->image }}" data-holder-rendered="true" style="">
                                                                            </div>
                                                                            <input type="file" class="form-control" name="image" id="img" />
                                                                        </div>
                                                                        <span class="text-danger">
                                                                            @error('status')
                                                                                {{ $message }}
                                                                            @enderror
                                                                        </span>
                                                                    </div>
                                                                    <div class="col-6">
                                                                        <div class="mb-3 col-md-6">
                                                                            <label class="fs-6 fw-semibold mb-2">Nominee Image</label>
                                                                            <div class="mb-2" id="selectedBanner2">
                                                                                <img class="img-thumbnail rounded me-2" id="customer_image" alt="" width="200" src="{{ $customer->nominee_image }}" data-holder-rendered="true" style="">
                                                                            </div>
                                                                            <input type="file" class="form-control" name="image2" id="img2" />
                                                                        </div>
                                                                        <span class="text-danger">
                                                                            @error('status')
                                                                                {{ $message }}
                                                                            @enderror
                                                                        </span>
                                                                    </div>
                                                                </div>
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
                <script src="https://code.jquery.com/jquery-3.6.0.min.js"
                integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
            {{-- <script>
                var selDiv = "";
                var storedFiles = [];
                $(document).ready(function() {
                    $("#img").on("change", handleFileSelect);
                    selDiv = $("#selectedBanner");
                });

                function handleFileSelect(e) {
                    var files = e.target.files;
                    var filesArr = Array.prototype.slice.call(files);
                    filesArr.forEach(function(f) {
                        if (!f.type.match("image.*")) {
                            return;
                        }
                        storedFiles.push(f);

                        var reader = new FileReader();
                        reader.onload = function(e) {
                            var html =
                                '<img src="' +
                                e.target.result +
                                "\" data-file='" +
                                f.name +
                                "' class='img-thumbnail rounded lg' alt='Category Image' height='200px' width='200px'>";
                            selDiv.html(html);
                        };
                        reader.readAsDataURL(f);
                    });
                }
            </script> --}}
            <script>
                var storedFiles = [];

                $(document).ready(function() {
                    $("#img").on("change", function() {
                        handleFileSelect(this, "#selectedBanner");
                    });

                    $("#img2").on("change", function() {
                        handleFileSelect(this, "#selectedBanner2");
                    });
                });

                function handleFileSelect(input, targetDiv) {
                    var files = input.files;   // input.files directly (no event object anymore)
                    var selDiv = $(targetDiv); // Dynamic target div

                    selDiv.empty(); // Clear old preview if any

                    var filesArr = Array.prototype.slice.call(files);
                    filesArr.forEach(function(f) {
                        if (!f.type.match("image.*")) {
                            return;
                        }
                        storedFiles.push(f);

                        var reader = new FileReader();
                        reader.onload = function(e) {
                            var html = `
                                <img src="${e.target.result}" 
                                    data-file="${f.name}" 
                                    class="img-thumbnail rounded lg mb-3" 
                                    alt="Category Image" 
                                    height="200px" width="200px">
                            `;
                            selDiv.html(html);
                        };
                        reader.readAsDataURL(f);
                    });
                }

            </script>
                @include("admin/dash/footer")
