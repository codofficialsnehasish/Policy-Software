                <footer class="footer">
                    <div class="container-fluid">
                        <div class="row">
                            <div class="col-12">
                                {{ copyright() }}. Crafted with <i class="mdi mdi-heart text-danger"></i> by Code of Dolphins
                            </div>
                        </div>
                    </div>
                </footer>

            </div>
            <!-- end main content-->

        </div>

        <!-- Right bar overlay-->
        <div class="rightbar-overlay"></div>

                <!-- JAVASCRIPT -->
                <script src="{{ asset('dashboard_assets/libs/jquery/jquery.min.js') }}"></script>
                <script src="{{ asset('dashboard_assets/libs/bootstrap/js/bootstrap.bundle.min.js') }}"></script>
                <script src="{{ asset('dashboard_assets/libs/metismenu/metisMenu.min.js') }}"></script>
                <script src="{{ asset('dashboard_assets/libs/simplebar/simplebar.min.js') }}"></script>
                <script src="{{ asset('dashboard_assets/libs/node-waves/waves.min.js') }}"></script>


        <!-- Peity chart-->
        <script src="{{ asset('dashboard_assets/libs/peity/jquery.peity.min.js') }}"></script>
        <script src="{{ asset('dashboard_assets/libs/parsleyjs/parsley.min.js') }}"></script>

        <!-- toast message -->
        <script src="{{ asset('dashboard_assets/libs/toast/toastr.js') }}"></script>
        <script src="{{ asset('dashboard_assets/js/pages/toastr.init.js') }}"></script>
        <!-- toast message -->
        @include('admin.dash._massages')

        
        <!-- Plugin Js-->
        
        <script src="{{ asset('dashboard_assets/js/pages/form-validation.init.js') }}"></script>
        

        <script src="{{ asset('dashboard_assets/js/pages/dashboard.init.js') }}"></script>

        <script src="{{ asset('dashboard_assets/js/app.js') }}"></script>

        <!-- Required datatable js -->
        <script src="{{ asset('dashboard_assets/libs/datatables.net/js/jquery.dataTables.min.js') }}"></script>
        <script src="{{ asset('dashboard_assets/libs/datatables.net-bs4/js/dataTables.bootstrap4.min.js') }}"></script>
        <!-- Buttons examples -->
        <script src="{{ asset('dashboard_assets/libs/datatables.net-buttons/js/dataTables.buttons.min.js') }}"></script>
        <script src="{{ asset('dashboard_assets/libs/datatables.net-buttons-bs4/js/buttons.bootstrap4.min.js') }}"></script>
        <script src="{{ asset('dashboard_assets/libs/jszip/jszip.min.js') }}"></script>
        <script src="{{ asset('dashboard_assets/libs/pdfmake/build/pdfmake.min.js') }}"></script>
        <script src="{{ asset('dashboard_assets/libs/pdfmake/build/vfs_fonts.js') }}"></script>
        <script src="{{ asset('dashboard_assets/libs/datatables.net-buttons/js/buttons.html5.min.js') }}"></script>
        <script src="{{ asset('dashboard_assets/libs/datatables.net-buttons/js/buttons.print.min.js') }}"></script>
        <script src="{{ asset('dashboard_assets/libs/datatables.net-buttons/js/buttons.colVis.min.js') }}"></script>
        <!-- Datatable init js -->
        <script src="{{ asset('dashboard_assets/js/pages/datatables.init.js') }}"></script> 
        <!-- form mask -->
        <script src="{{ asset('dashboard_assets/libs/inputmask/min/jquery.inputmask.bundle.min.js') }}"></script>

        <!-- form mask init -->
        <script src="{{ asset('dashboard_assets/js/pages/form-mask.init.js') }}"></script>
        <!--tinymce js-->
        <script src="{{ asset('dashboard_assets/libs/tinymce/tinymce.min.js') }}"></script>

        <!-- init js -->
        <script src="{{ asset('dashboard_assets/js/pages/form-editor.init.js') }}"></script>

        <script src="{{ asset('dashboard_assets/libs/bootstrap-datepicker/js/bootstrap-datepicker.min.js') }}"></script>
        <script src="{{ asset('dashboard_assets/libs/bootstrap-maxlength/bootstrap-maxlength.min.js') }}"></script>
        
        <!-- form repeater js -->
        <script src="{{ asset('dashboard_assets/libs/jquery.repeater/jquery.repeater.min.js') }}"></script>
        <script src="{{ asset('dashboard_assets/js/pages/form-repeater.int.js') }}"></script>

        <!-- Sweet Alerts js -->
        <script src="{{ asset('dashboard_assets/libs/sweetalert2/sweetalert2.min.js') }}"></script>

        <!-- Sweet alert init js-->
        <script src="{{ asset('dashboard_assets/js/pages/sweet-alerts.init.js') }}"></script>

        <script src="{{ asset('dashboard_assets/libs/admin-resources/bootstrap-filestyle/bootstrap-filestyle.min.js') }}"></script>

        <!-- form wizard -->
        <script src="{{ asset('dashboard_assets/libs/jquery-steps/build/jquery.steps.min.js') }}"></script>
        
        <!-- form wizard init -->
        <script src="{{ asset('dashboard_assets/js/pages/form-wizard.init.js') }}"></script>
        
        <!-- Responsive examples -->
        <!-- <script src="{{ asset('dashboard_assets/libs/datatables.net-responsive/js/dataTables.responsive.min.js') }}"></script> -->
        <!-- <script src="{{ asset('dashboard_assets/libs/datatables.net-responsive-bs4/js/responsive.bootstrap4.min.js') }}"></script> -->

        <script src="{{ asset('dashboard_assets/libs/select2/js/select2.full.min.js') }}"></script>
        <script src="{{ asset('dashboard_assets/libs/spectrum-colorpicker2/spectrum.min.js') }}"></script>
        <script src="{{ asset('dashboard_assets/js/pages/form-advanced.init.js') }}"></script>
        <script>
            $("#switch3").on("click", function() {
                var currentValue = parseInt($(this).val());
                var newValue = currentValue === 1 ? 0 : 1;
                $(this).val(newValue);
                // console.log("Checkbox value:", newValue);
            });
        </script>

        <script>
            // Custom sorting function for datetime columns
            jQuery.extend(jQuery.fn.dataTable.ext.type.order, {
                "datetime-moment-pre": function (d) {
                    // return moment(d, 'YYYY-MM-DD HH:mm:ss').unix();
                    return moment(d, 'MMM DD, YYYY hh:mm A').unix();
                }
            });
        </script>
        @yield('script')
    </body>
</html>
