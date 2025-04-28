<!-- adding header -->
@include('admin/dash/header')
<!-- end header -->

<!-- ========== Left Sidebar Start ========== -->
@include('admin/dash/left_side_bar')
<!-- Left Sidebar End -->

<div class="main-content">

    <div class="page-content">
        <div class="container-fluid">

            <!-- start page title -->
            <div class="page-title-box">
                <div class="row align-items-center">
                    <div class="col-md-8">
                        <h6 class="page-title">Customer Received</h6>
                        <ol class="breadcrumb m-0">
                            <li class="breadcrumb-item"><a href="{{ route('dashboard') }}">Dashboard</a></li>
                            <li class="breadcrumb-item"><a href="{{ route('policy-payment') }}">Customer Received</a></li>
                            <li class="breadcrumb-item active" aria-current="page">Add Received</li>
                        </ol>
                    </div>
                    <div class="col-md-4">
                        <div class="float-end d-none d-md-block">
                            <div class="dropdown">
                                <a href="{{ route('policy-payment') }}" class="btn btn-primary  dropdown-toggle"
                                    aria-expanded="false">
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
                            <form class="custom-validation" action="{{ route('policy-payment.process') }}"
                                method="post" enctype="multipart/form-data">
                                @csrf
                                <div class="row">
                                    <div class="col-lg-12">
                                        <div class="card">
                                            <div class="card-header bg-primary text-light">
                                                Add Received
                                            </div>
                                            <div class="card-body">
                                                <div class="row">
                                                    <div class="col-md-4 mb-3">
                                                        <label for="name" class="form-label">Customer Name:</label>
                                                        <div id="customer-image-container" class="mb-3 mt-2" style="display:none;">
                                                            <img id="customer-image" src="" alt="Customer Image" class="img-thumbnail rounded me-2" width="200">
                                                        </div>
                                                        <select class="form-select select2" id="customer_id" name="customer_id" required="" onchange="get_polices_by_customer(this.value)">
                                                            <option selected disabled value="">Choose...</option>
                                                            @foreach ($customers as $policy)
                                                                <option value="{{ $policy->id }}">{{ $policy->name }} - {{ $policy->customer_id }}</option>
                                                            @endforeach

                                                        </select>
                                                        <span class="text-danger">
                                                            @error('customer_id')
                                                                {{ $message }}
                                                            @enderror
                                                        </span>
                                                        <div class="invalid-feedback">
                                                            This field is required
                                                        </div>
                                                    </div>

                                                    <div class="col-md-4 mb-3">
                                                        <label for="name" class="form-label">Policy Number</label>
                                                        <!-- <input type="number" class="form-control" name="policy_no" id="policy_no" placeholder="Enter Policy No." required> -->
                                                        <select class="form-select select2" id="policy_option" name="policy_no">
                                                        </select>
                                                        <span class="text-danger">
                                                            @error('policy_no')
                                                                {{ $message }}
                                                            @enderror
                                                        </span>
                                                        <div class="invalid-feedback">
                                                            This field is required
                                                        </div>
                                                    </div>
                                                    

                                                    <div class="col-md-4">
                                                        <label for="" class="form-label">Policy Payment Mode</label>
                                                        <select class="form-select select2" id="payment_mode" required="" name="payment_mode">
                                                            <option selected="" disabled="" value="">Choose...</option>
                                                            @foreach ($Policy as $policy)
                                                            <option value="{{ $policy->id }}"{{ old('payment_mode') == $policy->name ? 'selected' : '' }}>{{ $policy->name }}</option>
                                                            @endforeach
                                                        </select>
                                                        <div class="invalid-feedback">
                                                            Please select a valid state.
                                                        </div>
                                                    </div>

                                                    <div class="col-md-4">
                                                        <label for="phone" class="form-label">Amount</label>

                                                        <div class="input-group has-validation">
                                                            <span class="input-group-text" id="premium_amount"><i class="fas fa-rupee-sign"></i>
                                                                    </span>
                                                            <input type="number" class="form-control"
                                                                name="amount" id="amount" placeholder="Enter Amount"
                                                                aria-describedby="inputGroupPrepend" required>
                                                        </div><span class="text-danger">
                                                            @error('amount')
                                                                {{ $message }}
                                                            @enderror
                                                        </span>
                                                        <div class="invalid-feedback">
                                                            This field is required
                                                        </div>
                                                    </div>
                                                    <div class="col-md-4" id="additional_input_container" style="display: none;">
                                                        <label for="additional_input" class="form-label">Reference Number</label>
                                                        <input type="text" class="form-control" id="additional_input" name="refference_number" placeholder="Enter Reference Number">
                                                    </div>
                                                    {{-- <div class="col-md-4">
                                                        <label for="phone" class="form-label">Acknowledgement Receipt</label>

                                                        <div class="input-group has-validation">
                                                            <span class="input-group-text" id="premium_amount"><i
                                                                    class="fas fa-phone"></i></span>
                                                            <input type="text" class="form-control" placeholder="acknowledgement_receipt" value="{{ old('acknowledgement_receipt') }}"
                                                                name="acknowledgement_receipt" id="acknowledgement_receipt"
                                                                aria-describedby="inputGroupPrepend" required>
                                                        </div><span class="text-danger">
                                                            @error('acknowledgement_receipt')
                                                                {{ $message }}
                                                            @enderror
                                                        </span>
                                                        <div class="invalid-feedback">
                                                            Please enter a valid acknowledgement receipt.
                                                        </div>
                                                    </div> --}}

                                                    <div class="mb-3 col-md-4">
                                                        <label class="form-label">Payment Date</label>
                                                        <div class="input-group" id="datepicker2">
                                                            <input type="text" class="form-control" placeholder="dd M, yyyy"
                                                                data-date-format="dd M, yyyy" data-date-container='#datepicker2' data-provide="datepicker"
                                                                data-date-autoclose="true" name="payment_date" autocomplete="off">

                                                            <span class="input-group-text"><i class="mdi mdi-calendar"></i></span>
                                                        </div><!-- input-group -->
                                                    </div>

                                                    <div class="col-md-4 mb-3 p-10">
                                                        <label for="remarks" class="form-label">Remarks</label>
                                                        <textarea class="form-control" id="remarks" name="remarks" rows="4" cols="" placeholder="Remarks">{{ old('remarks') }}</textarea>
                                                        <div class="invalid-feedback">
                                                            Please enter valid remarks.
                                                        </div>
                                                    </div>

                                                        {{-- @error('gender') is-invalid @enderror" --}}

                                                    


                                                    <div class="mb-0">
                                                        <div>
                                                            <button type="submit"
                                                                class="btn btn-primary waves-effect waves-light me-1">
                                                                Save & Publish
                                                            </button>
                                                            <button type="reset"
                                                                class="btn btn-secondary waves-effect">
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
    <script>
        document.addEventListener('DOMContentLoaded', function() {
            const paymentModeSelect = document.getElementById('payment_mode');
            const additionalInputContainer = document.getElementById('additional_input_container');

            paymentModeSelect.addEventListener('change', function() {
                const selectedOption = this.options[this.selectedIndex].text.toLowerCase();

                // Show the additional input field if the selected option is "online" or "cheque"
                if (selectedOption === 'online' || selectedOption === 'cheque') {
                    additionalInputContainer.style.display = 'block';
                } else {
                    additionalInputContainer.style.display = 'none';
                }
            });
        });

        function get_polices_by_customer(customer){
            // alert(customer);
            const custom_url = "{{ route('policy-payment.get.policy', ['id' => ':id']) }}".replace(':id', customer);
            $("#policy_option").html('');
            $.ajax({
                url : custom_url,
                type : 'GET',
                success:function(resp){
                    resp = JSON.parse(resp);
                    if (Array.isArray(resp) && resp.length > 0) {
                        $("#policy_option").append('<option value="">Choose...</option>');
                        $.each(resp , function(index, item) { 
                            $("#policy_option").append('<option value="'+item.policy_no+'">'+item.policy_no+'</option>');
                        });
                    } else {
                        $("#policy_option").append('<option value="">No policies found</option>');
                    }
                } 
            })
        }
    </script>

    @section('script')
    <script>
            $('#customer_id').on('change',function () {
                const customerId = $(this).val();
                const imageElement = $('#customer-image');
                $("#customer-image-container").hide();
                if (customerId) {
                    $.ajax({
                        url: '{{ route("customer.get-customer-image") }}',
                        type: 'POST',
                        data:{customer_id:customerId, _token:"{{ csrf_token() }}"},
                        success: function (response) {
                            // Update the image src with the returned URL
                            $("#customer-image-container").show();
                            imageElement.attr('src', response || '');
                        },
                        error: function () {
                            // Fallback to default image on error
                            imageElement.attr('src', '');
                        }
                    });
                } else {
                    // Reset to default image if no customer is selected
                    imageElement.attr('src', '');
                }
            });
        </script>
    @endsection

    @include('admin/dash/footer')
