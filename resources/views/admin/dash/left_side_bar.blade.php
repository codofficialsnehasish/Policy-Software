<div class="vertical-menu">
    <div data-simplebar class="h-100">
        <!--- Sidemenu -->
        <div id="sidebar-menu">
            <!-- Left Menu Start -->
            <ul class="metismenu list-unstyled" id="side-menu">
                <!-- <li class="menu-title">Main</li> -->
                <li>
                    <a href="{{ route('dashboard') }}" class="waves-effect">
                        <i class="ti-home"></i>
                        <!-- <span class="badge rounded-pill bg-primary float-end">2</span> -->
                        <span>Dashboard</span>
                    </a>
                </li>
                <li>
                    <a href="{{ route('settings') }}" class="has-arrow waves-effect">
                        <i class="ti-settings"></i>
                        <span class="badge rounded-pill bg-danger float-end" id="custo"></span>
                        <span>Settings</span>
                    </a>
                    <ul class="sub-menu" aria-expanded="false">
                        <li><a href="{{ route('settings') }}">Site Settings</a></li>
                    </ul>
                </li>

                <li>
                    <a href="javascript: void(0);" class="has-arrow waves-effect">
                        <i class="fas fa-database"></i>
                        <span>Policy Master</span>
                    </a>
                    <ul class="sub-menu" aria-expanded="false">
                        <li><a href="{{ route('policy-type') }}">Policy Types</a></li>
                        <li><a href="{{ route('frequency.policy') }}">Policy Frequency</a></li>
                        <li><a href="{{ route('payment') }}">Policy Payment Mode</a></li>
                        <li><a href="{{ route('area') }}">Area</a></li>
                    </ul>
                </li>

                <li>
                    <a href="javascript: void(0);" class="has-arrow waves-effect">
                        <i class="fas fa-house-user"></i>
                        <span class="badge rounded-pill bg-danger float-end" id="custo"></span>
                        <span>Advisor</span>
                    </a>
                    <ul class="sub-menu" aria-expanded="false">
                        <li><a href="{{ route('agent.add') }}">Add Advisor</a></li>
                        <li><a href="{{ route('agent') }}">All Advisor</a></li>
                    </ul>
                </li>
                <li>
                    <a href="javascript: void(0);" class="has-arrow waves-effect">
                        <i class="fas fa-users"></i>
                        <span class="badge rounded-pill bg-danger float-end" id="custo"></span>
                        <span>Customer</span>
                    </a>
                    <ul class="sub-menu" aria-expanded="false">
                        <li><a href="{{ route('customer.add') }}">Add Customers</a></li>
                        <li><a href="{{ route('customer') }}">All Customers</a></li>
                    </ul>
                </li>


                <li>
                    <a href="{{ route('policy') }}" class="has-arrow waves-effect">
                        <i class="fas fa-book-medical"></i>
                        <span>Policy</span>
                    </a>
                    <ul class="sub-menu" aria-expanded="false">
                        <li><a href="{{ route('policy.add') }}">Add Policy</a></li>
                        <li><a href="{{ route('policy') }}">All Policy</a></li>
                    </ul>
                </li>
                <li>
                    <a href="{{ route('policy-payment') }}" class="has waves-effect">
                        <i class="fab fa-amazon-pay"></i>
                        <span>Customer Received</span>
                    </a>
                </li>
                <li>
                    <a href="{{ route('bank-policy-payment.index') }}" class="has waves-effect">
                        <i class="fab fa-cc-amazon-pay"></i>
                        <span>Policy Payment</span>
                    </a>
                </li>
                <li>
                    <a href="{{ route('due-payment.index') }}" class="has waves-effect">
                        <i class="mdi mdi-calendar-clock"></i>
                        <span>Due Payments</span>
                    </a>
                </li>
                <li>
                    <a href="{{ route('customer-statement.index') }}" class="has waves-effect">
                        <i class="fas fa-file-invoice"></i>
                        <span>Customer Statement</span>
                    </a>
                </li>
                <li>
                    <a href="javascript: void(0);" class="has-arrow waves-effect">
                        <i class="fas fa-chart-bar"></i>
                        <span>Area Wise Statement</span>
                    </a>
                    <ul class="sub-menu" aria-expanded="false">
                        <li><a href="{{ route('reports.areaWiseStatement') }}">Area wise All Policy</a></li>
                    </ul>
                </li>
                <li>
                    </a><a href="javascript: void(0);" class="has-arrow waves-effect">
                        <i class="fas fa-book-open"></i>
                        <span>Daily Cashbook</span>
                    </a>
                    <ul class="sub-menu" aria-expanded="false">
                        <li><a href="{{ route('reports.all_transaction') }}">All Transaction</a></li>
                        <li><a href="{{ route('reports.transaction') }}">Bank Transfer</a></li>
                        <li><a href="{{ route('reports.cash_in_hand') }}">Cash in Hand</a></li>
                        <li><a href="{{ route('reports.month') }}">Month wise Total Statement</a></li>
                        <li><a href="{{ route('reports.month-statement-view') }}">Month Statement</a></li>
                    </ul>

                </li>


                <li>
                    <a href="{{ route('reports.areaWiseAgentList') }}" class="has-arro waves-effect">
                        <i class="fas fa-clipboard-list"></i>
                        <span>Area Wise Advisor List</span>
                    </a>

                </li>
            </ul>
        </div>
        <!-- Sidebar -->
    </div>
</div>

