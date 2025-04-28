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
                                    <h6 class="page-title">{{ $title }}</h6>
                                    <ol class="breadcrumb m-0">
                                        <li class="breadcrumb-item"><a href="{{ route('dashboard') }}">Dashboard</a></li>
                                        <li class="breadcrumb-item"><a href="{{ route('policy-payment') }}">{{ $title }}</a></li>
                                        <li class="breadcrumb-item active" aria-current="page">All {{ $title }}</li>
                                    </ol>
                                </div>
                                <div class="col-md-4 mt-2">
                                    <div class="float-end">
                                        <div class="dropdown">
                                            <a href="{{ route('bank-policy-payment.create') }}" class="btn btn-primary  dropdown-toggle" aria-expanded="false">
                                                <i class="fas fa-plus me-2"></i> Add New {{ $title }}
                                            </a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!-- end page title -->

                        <div class="row">
                            <div class="col-12">
                                <div class="card">
                                    <div class="card-body">
                                        <form action="{{ route('bank-policy-payment.index') }}" method="GET">
                                            <!-- show data -->
                                            <div class="row justify-content-center">
                                                <div class="mb-3 col-md-10">
                                                    <label class="form-label">Date Range</label>
                                                    <div class="input-daterange input-group" id="datepicker6" data-date-format="yyyy-mm-dd" data-date-autoclose="true" data-provide="datepicker" data-date-container='#datepicker6'>
                                                        <input type="text" class="form-control" value="{{ $start_date ?? '' }}" name="start" placeholder="Start Date" autocomplete="off"/>
                                                        <input type="text" class="form-control" value="{{ $end_date ?? '' }}" name="end" placeholder="End Date" autocomplete="off"/>
                                                    </div>
                                                </div>
                                                <div class="col-md-2 mt-4">
                                                    <button type="submit" name="button" value="search" class="btn btn-success">Search</button>
                                                </div>
                                            </div>
                                        </form>
                                    </div>
                                </div>
                            </div>
                        </div>

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
                                                @php $total_amount = 0; @endphp
                                                @foreach($policy_payment as $s)
                                                @php $total_amount += $s->amount; @endphp
                                                <tr>
                                                    <td> {{ $i++ }}</td>
                                                    <td>{{$s->policy_number != 0 ? $s->policy_number : ''}}</td>
                                                    <td>{{ get_customer_id($s->customer_id) }}</td>
                                                    <td class="text-wrap">{{ get_name('customers',$s->customer_id) }}</td>
                                                    <td>{{$s->amount}}</td>
                                                    <td class="text-wrap">{{ get_name('payment_modes',$s->payment_mode) }} @if(get_name('payment_modes',$s->payment_mode) == 'Cheque' || get_name('payment_modes',$s->payment_mode) == 'Online') (Ref - {{$s->refference_number}}) @endif</td>
                                                    <td>{{ formated_date($s->payment_date) }}</td>
                                                    <td>
                                                        <!-- <a class="btn btn-outline-info" href="{{ route('policy-payment.download', $s->id) }}">Download</a> -->
                                                        <a class="btn btn-outline-success" href="{{ route('bank-policy-payment.receipt', $s->id) }}">View</a>
                                                    </td>
                                                    <td>
                                                        <a class="btn btn-success mr-2" href="{{ route('bank-policy-payment.edit', $s->id) }}" alt="edit"><i class="ti-check-box"></i></a>
                                                        <!-- <a class="btn btn-danger" onclick="return confirm('Are you sure?')" href="{{ route('bank-policy-payment.destroy', $s->id) }}"><i class="ti-trash"></i></a> -->
                                                        <form action="{{ route('bank-policy-payment.destroy', $s->id) }}" method="POST" style="display:inline;">
                                                            @csrf
                                                            @method('DELETE')
                                                            <button class="btn btn-danger" type="submit"><i class="ti-trash"></i></button>
                                                        </form>
                                                    </td>
                                                </tr>
                                                @endforeach
                                                <tr>
                                                    <td>Total Amount</td>
                                                    <td></td>
                                                    <td></td>
                                                    <td></td>
                                                    <td>{{ $total_amount }}</td>
                                                    <td></td>
                                                    <td></td>
                                                    <td></td>
                                                    <td></td>
                                                </tr>
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
