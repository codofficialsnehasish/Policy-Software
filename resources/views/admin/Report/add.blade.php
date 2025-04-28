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
                                    <h6 class="page-title">Policy</h6>
                                    <ol class="breadcrumb m-0">
                                        <li class="breadcrumb-item"><a href="{{ route('dashboard') }}">Home</a></li>
                                        <li class="breadcrumb-item"><a href="{{ route('policy') }}">Policy</a></li>
                                        <li class="breadcrumb-item active" aria-current="page">Add Policy</li>
                                    </ol>
                                </div>
                                <div class="col-md-4">
                                    <div class="float-end d-none d-md-block">
                                        <div class="dropdown">
                                            <a href="{{ route('policy') }}" class="btn btn-primary  dropdown-toggle" aria-expanded="false">
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
                                        <form class="custom-validation" action="{{route('policy.process')}}" method="post" enctype="multipart/form-data">
                                            @csrf
                                            <div class="row">
                                                <div class="col-lg-12">
                                                    <div class="card">
                                                        <div class="card-header bg-primary text-light">
                                                            Add Policy
                                                        </div>
                                                        <div class="card-body">
                                                            <div class="row">
                                                                {{-- <div class="col-md-4 mb-3">
                                                                    <label for="name" class="form-label">Policy Number</label>
                                                                    <input type="number" class="form-control" name="policy_no" id="policy_no" placeholder="policy_no" required>
                                                                    <div class="invalid-feedback">
                                                                        This field is required
                                                                    </div>
                                                                </div> --}}
                                                                <div class="col-md-4">
                                                                    <label for="gender" class="form-label">Policy Type</label>
                                                                    <select class="form-select select2" id="policy_type" required="" name="policy_type">
                                                                        @foreach ($Policy as $policy)
                                                                        <option selected="" disabled="" value="">Choose...</option>
                                                                        <option value="{{ $policy->name }}"{{ old('policy_type') == $policy->name ? 'selected' : '' }}>{{ $policy->name }}</option>
                                                                        @endforeach
                                                                    </select>
                                                                    <div class="invalid-feedback">
                                                                        Please select a valid state.
                                                                    </div>
                                                                </div>
                                                                <div class="col-md-4 mb-3">
                                                                    <label for="name" class="form-label">Sum Assured</label>
                                                                    <input type="number" class="form-control" name="sum_assured" id="name" placeholder="sum_assured" required>
                                                                    <div class="invalid-feedback">
                                                                        This field is required
                                                                    </div>
                                                                </div>
                                                                <div class="col-md-4 mb-3">
                                                                    <label for="name" class="form-label">Policy Term  (years):</label>
                                                                    <input type="text" class="form-control" name="policy_term" id="policy_term" placeholder="Policy Term like:2024-2029" required>
                                                                    <div class="invalid-feedback">
                                                                        This field is required
                                                                    </div>
                                                                </div>
                                                                <div class="col-md-4">
                                                                    <label for="email" class="form-label">Maturity Date</label>
                                                                    <div class="input-group" id="datepicker2">
                                                                        <input type="text" class="form-control" placeholder="dd M, yyyy" name="maturity_date"
                                                                            data-date-format="dd M, yyyy" data-date-container='#datepicker2' data-provide="datepicker"
                                                                            data-date-autoclose="true">

                                                                        <span class="input-group-text"><i class="mdi mdi-calendar"></i></span>
                                                                    </div>
                                                                </div>
                                                                <div class="col-md-4 mb-3">
                                                                    <label for="name" class="form-label">Nominee Name</label>
                                                                    <input type="text" class="form-control" name="nominee_name" id="nominee_name" placeholder="NomineeName" required>
                                                                    <div class="invalid-feedback">
                                                                        This field is required
                                                                    </div>
                                                                </div>
                                                                <div class="col-md-4 mb-3">
                                                                    <label for="name" class="form-label">Nominee Relationship</label>
                                                                    <input type="text" class="form-control" name="nominee_relationship" id="nominee_relationship" placeholder="nominee_relationship" required>
                                                                    <div class="invalid-feedback">
                                                                        This field is required
                                                                    </div>
                                                                </div>
                                                                <div class="col-md-4">
                                                                    <label for="phone" class="form-label">Nominee Contact Number</label>
                                                                    <div class="input-group has-validation">
                                                                        <span class="input-group-text" id="phone"><i class="fas fa-phone"></i></span>
                                                                        <input type="number" class="form-control" name="nominee_contact_number" id="phone" aria-describedby="inputGroupPrepend" required>
                                                                    </div>
                                                                    <div class="invalid-feedback">
                                                                        This field is required
                                                                    </div>
                                                                </div>


                                                                <div class="mb-0 p-10 mt-2">
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
