<!-- adding header -->
@include("admin.dash.header")
<!-- end header -->

            <!-- ========== Left Sidebar Start ========== -->
            @include("admin.dash.left_side_bar")
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
                                        <li class="breadcrumb-item active" aria-current="page">All Customer Received</li>
                                    </ol>
                                </div>
                                <div class="col-md-4 mt-2">
                                    <div class="float-end">
                                        <div class="dropdown">
                                        <a href="{{ route('policy-payment.add') }}" class="btn btn-primary  dropdown-toggle" aria-expanded="false">
                                        <i class="fas fa-plus me-2"></i> Add New Received
                                        </a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!-- end page title -->

                        <!-- show data -->
                        <div class="row">
                            <div class="col-12">
                                <div class="card">
                                    <div class="card-body table-responsive">
                                        <table id="datatable-buttons" class="table table-striped table-bordered dt-responsive nowrap" style="border-collapse: collapse; border-spacing: 0; width: 100%;">
                                            <thead>
                                                <tr>
                                                    <th class="text-wrap">Sl. No</th>
                                                    <th>Policy No</th>
                                                    <th>Customer ID</th>
                                                    <th>Customer Name</th>
                                                    <th>Amount</th>
                                                    <th>Payment_mode</th>
                                                    <th>Payment Date</th>
                                                    <th>Receipt</th>
                                                    <th>Action</th>
                                                </tr>
                                            </thead>

                                            <tbody>
                                                @php $i = 1 @endphp
                                                @foreach($policyPaymentModes as $s)
                                                <tr>
                                                    <td> {{ $i++ }}</td>
                                                    <td>{{ $s->policy_number != 0 ? $s->policy_number : '' }}</td>
                                                    <td>{{ get_customer_id($s->customer_id) }}</td>
                                                    <td class="text-wrap">{{ get_name('customers',$s->customer_id) }}</td>
                                                    <td>{{$s->amount}}</td>
                                                    <td class="text-wrap">{{ get_name('payment_modes',$s->payment_mode) }} @if(get_name('payment_modes',$s->payment_mode) == 'Cheque' || get_name('payment_modes',$s->payment_mode) == 'Online') (Ref - {{$s->refference_number}}) @endif</td>
                                                    <td>{{ formated_date($s->payment_date) }}</td>
                                                    <td>
                                                        <!-- <a class="btn btn-outline-info" href="{{ route('policy-payment.download', $s->id) }}">Download</a> -->
                                                        <a class="btn btn-outline-success" href="{{ route('policy-payment.receipt', $s->id) }}">View</a>
                                                    </td>
                                                    <td>
                                                        <a class="btn btn-success mr-2" href="{{ route('policy-payment.edit', $s->id) }}" alt="edit"><i class="ti-check-box"></i></a>
                                                        <a class="btn btn-danger" onclick="return confirm('Are you sure?')" href="{{ route('policy-payment.delete', $s->id) }}"><i class="ti-trash"></i></a>
                                                    </td>
                                                </tr>
                                                @endforeach
                                            </tbody>
                                        </table>

                                    </div>
                                </div>
                            </div>
                        </div>
                        <!-- end show data -->

                    </div> <!-- container-fluid -->
                </div>
                <!-- End Page-content -->

                <script>
                    function openTab(tabName) {
                        // Hide all tab content
                        document.querySelectorAll('.tab-content').forEach(tab => {
                            tab.classList.remove('active');
                        });
                        // Show the selected tab content
                        document.getElementById(tabName).classList.add('active');

                        // Highlight the selected tab
                        document.querySelectorAll('.network-tab').forEach(tab => {
                            tab.classList.remove('active');
                        });
                        document.querySelector(`.network-tab[data-target="${tabName}"]`).classList.add('active');
                    }
                </script>

                @include("admin.dash.footer")
