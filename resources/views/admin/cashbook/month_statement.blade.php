<!-- adding header -->
@include('admin.dash.header')
<!-- end header -->

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
                        <h6 class="page-title">Month Statement</h6>
                        <ol class="breadcrumb m-0">
                            <li class="breadcrumb-item"><a href="{{ route('dashboard') }}">Dashboard</a></li>
                            <li class="breadcrumb-item"><a href="javascript:void(0)">Daily Cashbook</a></li>
                            <li class="breadcrumb-item active" aria-current="page">Month Statement</li>
                        </ol>
                    </div>
                </div>
            </div>
        </div>
        <!-- end page title -->
        <div class="row">
            <div class="col-12">
                <div class="card">
                    <div class="card-body">
                        <form action="{{ route('reports.month-statement') }}" method="POST">
                            @csrf
                            <!-- show data -->
                            <div class="row">
                                <div class="col-md-5">
                                    <div class="form-group">
                                        <label for="month">Select Month:</label>
                                        <select name="month" id="month" class="form-control select2">
                                            @php
                                                $currentMonth = now()->month; // Get current month (1-12)
                                                $selectedMonth = $selectedMonth ?? $currentMonth; // Use current month if $selectedMonth is null
                                            @endphp
                                            @for ($i = 1; $i <= 12; $i++)
                                                <option value="{{ $i }}" {{ $selectedMonth == $i ? 'selected' : '' }}>
                                                    {{ DateTime::createFromFormat('!m', $i)->format('F') }}
                                                </option>
                                            @endfor
                                        </select>                                        
                                    </div>
                                </div>
                                <div class="col-md-2">
                                    <div class="form-group">
                                        <label for="year">Select Year:</label>
                                        @php
                                            $currentYear = date('Y');
                                            $selectedYear = $selectedYear ?? $currentYear; // Default to current year if not set
                                        @endphp
                                        <select name="year" id="year" class="form-control select2">
                                            <option value="">All</option>
                                            @for ($i = $currentYear; $i >= $currentYear - 10; $i--)
                                                <option value="{{ $i }}" {{ $selectedYear == $i ? 'selected' : '' }}>
                                                    {{ $i }}
                                                </option>
                                            @endfor
                                        </select>
                                    </div>
                                </div>
                                
                                
                                {{-- <div class="mb-3 col-md-5">
                                    <label class="form-label">Date Range</label>
                                    <div class="input-daterange input-group" id="datepicker6" data-date-format="yyyy-mm-dd" data-date-autoclose="true" data-provide="datepicker" data-date-container='#datepicker6'>
                                        <input type="text" class="form-control" value="{{ $start_date ?? '' }}" name="start" placeholder="Start Date" autocomplete="off"/>
                                        <input type="text" class="form-control" value="{{ $end_date ?? '' }}" name="end" placeholder="End Date" autocomplete="off"/>
                                    </div>
                                </div> --}}
                                <div class="col-md-2 mt-4">
                                    <button type="submit" name="button" value="search" class="btn btn-success">Search Statement</button>
                                </div>
                                <div class="col-md-2 mt-4">
                                    <div class="float-end d-none d-md-block">
                                        <button type="submit" name="button" value="download" class="btn btn-primary"><i class="fas fa-file-pdf me-2"></i> Print To PDF</button>
                                    </div>
                                </div>
                                {{-- <div class="col-md-2 mt-4">
                                    <div class="float-end d-none d-md-block">
                                        <button type="submit" name="button" value="download" class="btn btn-primary"><i class="fas fa-file-pdf me-2"></i> Print To PDF</button>
                                    </div>
                                </div> --}}
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>

        @if(!empty($statements))
        <div class="row">
            <div class="col-12">
                <div class="card">
                    <div class="card-body table-responsive">
                        <table id="datatable-buttons" class="table table-striped table-bordered dt-responsive nowrap"
                            style="border-collapse: collapse; border-spacing: 0; width: 100%;">
                            <thead>
                                <tr>
                                    <th class="text-wrap">Sl. No</th>
                                    <th class="text-wrap">Customer ID</th>
                                    <th class="text-wrap">Customer Name</th>
                                    <th class="text-wrap">Opening Balance</th>
                                    <th class="text-wrap">Cash Deposit</th>
                                    <th class="text-wrap">Closing Balance</th>
                                </tr>
                            </thead>
                            <tbody>
                                @php 
                                    $total_opening_balance = 0; 
                                    $total_diposite_balance = 0; 
                                    $total_closing_balance = 0; 
                                @endphp
                                @foreach($statements as $s)
                                @php 
                                    $total_opening_balance += $s['opening_balance'] ?? 00 ;
                                    $total_diposite_balance += $s['cash_deposited'] ?? 00 ;
                                    $total_closing_balance += $s['closing_balance'] ?? 00 ;
                                @endphp
                                    <tr>
                                        <td>{{ $loop->iteration }}</td>
                                        <td>{{ get_customer_id($s['customer_id']) }}</td>
                                        <td>{{ $s['customer_name'] ?? '' }}</td>
                                        <td>{{ $s['opening_balance'] ?? 0.00 }}</td>
                                        <td>{{ $s['cash_deposited'] ?? 0.00 }}</td>
                                        <td>{{ $s['closing_balance'] ?? 0.00 }}</td>
                                    </tr>
                                @endforeach
                                <tr>
                                    <td><strong>Total Amount</strong></td>
                                    <td></td>
                                    <td></td>
                                    <td><strong>{{ $total_opening_balance }}</strong></td>
                                    <td><strong>{{ $total_diposite_balance }}</strong></td>
                                    <td><strong>{{ $total_closing_balance }}</strong></td>
                                </tr>
                            </tbody>
                            {{-- <tr>
                                <td><strong>Total Amount</strong></td>
                                <td></td>
                                <td></td>
                                <td><strong>{{ $total_opening_balance }}</strong></td>
                                <td><strong>{{ $total_diposite_balance }}</strong></td>
                                <td><strong>{{ $total_closing_balance }}</strong></td>
                            </tr> --}}
                        </table>
                    </div>
                </div>
            </div>
        </div>
        @endif
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

@include('admin.dash.footer')
