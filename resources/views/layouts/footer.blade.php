<!-- resources/views/includes/footer.blade.php -->
<footer style="position: fixed; bottom: -22px   ; left: 0; width: 100%; background-color: #f1f1f1; padding: 10px 0;">
    <div class="container-fluid">
        <div class="row">
            <div class="col-md-12 text-center">
                <p>&copy; {{ date('Y') }} Nerasoft. All rights reserved. Powered by <a href="https://nerasoft.in/"
                        target="_blank">Nerasoft</a></p>
            </div>
        </div>
    </div>
</footer>
<script src="{{ asset('assets/js/vendor.min.js') }}" type="text/javascript"></script>
<script src="{{ asset('assets/js/app.min.js') }}" type="text/javascript"></script>
<!--Datatable--->
<script src="{{ asset('assets/plugins/datatables.net/js/jquery.dataTables.min.js') }}" type="text/javascript"></script>
<script src="{{ asset('assets/plugins/datatables.net-bs5/js/dataTables.bootstrap5.min.js') }}" type="text/javascript">
</script>
<script src="{{ asset('assets/plugins/datatables.net-responsive/js/dataTables.responsive.min.js') }}"
    type="text/javascript"></script>
<script src="{{ asset('assets/plugins/datatables.net-responsive-bs5/js/responsive.bootstrap5.min.js') }}"
    type="text/javascript"></script>
<script src="{{ asset('assets/js/demo/table-manage-default.demo.js') }}" type="text/javascript"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-tagsinput/0.8.0/bootstrap-tagsinput.min.js"></script>
<script src="https://cdn.ckeditor.com/4.21.0/standard/ckeditor.js"></script>
<script>
    CKEDITOR.replace('editor');
    CKEDITOR.replace('editor2');
</script>
<script>
    var thispageurl = window.location.href;
    console.log(thispageurl)
    $(".find-link .menu-item").children().each(function() {
        if (this.href === thispageurl) {
            $(this).closest(".menu-item").addClass("active")
            $(this).closest(".has-sub").addClass("active")
        }
    });
</script>
<script src="{{ asset('toast.js') }}"></script>
<script>
    $(document).ready(function() {
        // Check for success message in the session
        @if (session('success'))
            $.toast({
                type: 'info', // Set type to 'success'
                title: 'Success!',
                content: "{{ session('success') }}", // Get success message from session
                delay: 5000,
            });
        @endif

        // Check for error message in the session
        @if (session('error'))
            $.toast({
                type: 'error', // Set type to 'error'
                title: 'Error!',
                content: "{{ session('error') }}", // Get error message from session
                delay: 5000,
            });
        @endif
    });
</script>
<script>
    function ChangeStatus(table_name, id) {
        var csrfToken = $('meta[name="csrf-token"]').attr('content');
        if ($("#flexSwitchCheckDefault" + id + "").is(':checked')) {
            var status = 1;
        } else {
            var status = 2;
        }

        $.ajax({
            url: "{{ route('change.status') }}",
            type: 'post',
            data: {
                _token: csrfToken,
                table_name: table_name,
                id: id,
                status: status
            },
            success: function(response) {
                console.log(response);
            }
        });
        return false;
    }

    function updatePaymentStatus(id) {

    var csrfToken = $('meta[name="csrf-token"]').attr('content');
    var transactionAmount = $("#transaction_amount" + id).val();
    var paymentStatus = $("#payment_status" + id).val();
    if(paymentStatus == 1){
        alert('Please Select Paid Option.');
        return false;
    }
    var fileInput = $("#file_upload" + id)[0];

    // Validate transaction amount
    if (!transactionAmount || isNaN(transactionAmount) || transactionAmount <= 0) {
        alert('Please enter a valid amount.');
        return false;
    }

    // Validate file input
    if (!fileInput || fileInput.files.length === 0) {
        alert('Please select a file to upload.');
        return false;
    }

    var formData = new FormData();
    formData.append('_token', csrfToken);
    formData.append('transaction_amount', transactionAmount);
    formData.append('payment_status', paymentStatus);
    formData.append('id', id);
    formData.append('file', fileInput.files[0]);

    $.ajax({
        url: "{{ route('update.payment.status') }}",
        type: 'POST',
        data: formData,
        contentType: false,
        processData: false,
        success: function(response) {
            console.log(response);
            if (response === "OK") {
                alert(response.message || "Payment status updated successfully.");
                window.location.reload();
            } else {
                alert('Failed to update payment status: ' + (response.message || 'Unknown error.'));
            }
        },
        error: function(xhr, status, error) {
            console.error('Error:', error);
            alert('An error occurred while updating payment status. Please try again.');
        }
    });

    return false;
}



    function is_user_verified(table_name, id) {
        var csrfToken = $('meta[name="csrf-token"]').attr('content');
        if ($("#is_user_verified" + id + "").is(':checked')) {
            var status = 1;
        } else {
            var status = 2;
        }
        $.ajax({
            url: "{{ route('user.verified') }}",
            type: 'post',
            data: {
                _token: csrfToken,
                table_name: table_name,
                id: id,
                status: status
            },
            success: function(response) {
                var routeUrl = "{{ route('approved.member') }}";
                window.location.href = routeUrl;
                console.log(response);
            }
        });
        return false;
    }
</script>
<script>
    function ChangeStatusApproved(table_name, id) {
        if (confirm('Are you sure you want to approve')) {

            var csrfToken = $('meta[name="csrf-token"]').attr('content');
            if ($("#flexSwitchCheckDefaultproperty" + id + "").is(':checked')) {
                var status = 1;
            } else {
                var status = 2;
            }

            $.ajax({
                url: "{{ route('change.status.property') }}",
                type: 'post',
                data: {
                    _token: csrfToken,
                    table_name: table_name,
                    id: id,
                    status: status
                },
                success: function(response) {
                    var routeUrl = "{{ route('property') }}";
                    window.location.href = routeUrl;
                    console.log(response);
                }
            });
            return false;
        } else {
            if ($("#flexSwitchCheckDefaultproperty" + id + "").is(':checked')) {
                $("#flexSwitchCheckDefaultproperty" + id + "").prop('checked', false);
            }
        }
    }
</script>
<script>
    fetchNotes();

    function SaveNotes() {
        var status = $('#status').val();
        var lead_id = $('#lead_id').val();
        var csrfToken = $('meta[name="csrf-token"]').attr('content');
        if (status == 5) {
            if (route_id === '') {
                Swal.fire("Error!", "Please Select Route!", "error"); // Correct SweetAlert2 syntax
                return false;
            }
        }
        $.ajax({
            url: "{{ route('notes.create') }}",
            type: 'POST',
            data: {
                _token: csrfToken,
                status: status,
                lead_id: lead_id,
            },
            success: function(response) {
                if (response == 1) {
                    window.location.reload();

                }
            },
            error: function(xhr, status, error) {
                console.error(xhr.responseText);
                Swal.fire("Error!", "An error occurred while saving the note.", "error");
            }
        });
    }

    function fetchNotes() {

        var lead_id = $('#lead_id').val();
        var csrfToken = $('meta[name="csrf-token"]').attr('content');
        $.ajax({
            url: "{{ route('notes.fetch') }}",
            type: 'POST',
            data: {
                _token: csrfToken,
                lead_id: lead_id
            },
            success: function(response) {
                $("#note_html").html(response);
                console.log(respone);
            },
            error: function(xhr, status, error) {
                console.error(xhr.responseText);
                alert("An error occurred while saving the note.");
            }
        });
    }

    function deleteNotes(id) {
        if (confirm('Are you sure you want to delete this note?')) {

            var lead_id = id;
            var csrfToken = $('meta[name="csrf-token"]').attr('content');
            $.ajax({
                url: "{{ route('notes.delete') }}",
                type: 'POST',
                data: {
                    _token: csrfToken,
                    note_id: lead_id
                },
                success: function(response) {
                    fetchNotes();
                },
                error: function(xhr, status, error) {
                    console.error(xhr.responseText);
                    alert("An error occurred while saving the note.");
                }
            });
        }
    }

    function editnotes(id) {

        var dataMessage = $('a[onclick="editnotes(' + id + ')"]').data('message');
        $("#notes").val(dataMessage);
        $("#hidden_id").val(id);
    }

    function startDisscussion(id, user_id) {

        var id = id;
        var user_id = user_id;
        var csrfToken = $('meta[name="csrf-token"]').attr('content');
        $.ajax({
            url: "{{ route('notes.disscuss') }}",
            type: 'POST',
            data: {
                _token: csrfToken,
                id: id,
                user_id: user_id
            },
            success: function(response) {
                window.location.reload();
                fetchNotes();
            },
            error: function(xhr, status, error) {
                console.error(xhr.responseText);
                alert("An error occurred while saving the note.");
            }
        });
    }

    function ViewrightModal(lead_id) {
        var lead_id = lead_id;

        var csrfToken = $('meta[name="csrf-token"]').attr('content');
        $.ajax({
            url: "{{ route('viewright.modal') }}",
            type: 'POST',
            data: {
                _token: csrfToken,
                lead_id: lead_id,

            },
            success: function(response) {
                $(".job-tracking-vertical").html(response);
            },
            error: function(xhr, status, error) {
                console.error(xhr.responseText);
                alert("An error occurred while saving the note.");
            }
        });
    }

    function Change_kyc_status(kyc_id) {
        var kyc_status = $("#routeSelect").val();
        if (kyc_status == 3) {
            $("#myModal").modal('show');
        }
        if (kyc_status == 4) {
            $("#RejectModal").modal('show');
        }
        $(".kyc_id").val(kyc_id);
        $(".kyc_status").val(kyc_status);

    }

    function showDropdown() {

    }
</script>
<script>
    $(document).ready(function() {
        // Initialize the tags input
        $('input[name="zip_code"]').tagsinput({
            trimValue: true,
            confirmKeys: [13, 44, 32], // enter, comma, space
            focusClass: 'my-focus-class'
        });

        // Zip code validation function
        function isValidZipCode(zip) {
            return /^\d{6}$/.test(zip); // Check if zip code is exactly 6 digits
        }

        // Validate zip code before adding
        $('input[name="zip_code"]').on('beforeItemAdd', function(event) {
            var zipCode = event.item;

            if (!isValidZipCode(zipCode)) {
                event.cancel = true; // Prevent adding if it's not 6 digits
                alert("Each zip code must be exactly 6 digits.");
            }
        });

        // Add focus/blur classes for input field
        $('.bootstrap-tagsinput input').on('focus', function() {
            $(this).closest('.bootstrap-tagsinput').addClass('has-focus');
        }).on('blur', function() {
            $(this).closest('.bootstrap-tagsinput').removeClass('has-focus');
        });
    });
</script>
@if (Request::segment(1) === 'userlocation' && @$get_otp_status->status != 2)
    <script>
        $(document).ready(function() {
            // Initialize the modal with options to prevent closing
            var myModal = new bootstrap.Modal(document.getElementById('myModal'), {
                backdrop: 'static', // Prevent closing when clicking outside the modal
                keyboard: false // Prevent closing with the Escape key
            });

            // Show the modal on page load
            myModal.show();
        });
    </script>
@endif
<script>
    function checkUserLocationOtp() {
        var otp = $("#user_location_otp").val();
        if (otp == '') {
            Swal.fire("Error!", "OTP Required!", "error");
            return false;
        }
        var csrfToken = $('meta[name="csrf-token"]').attr('content');
        $.ajax({
            url: "{{ route('userlocation.otp.check') }}",
            type: 'POST',
            data: {
                _token: csrfToken,
                otp: otp

            },
            success: function(response) {
                console.log(response);
                if (response == true) {
                    Swal.fire({
                        title: "Success!",
                        text: "Otp Verify Successfully!",
                        icon: "success",
                        timer: 2000,
                        showConfirmButton: false
                    }).then(function() {
                        var routeUrl = "{{ route('userlocation') }}";

                        var encodedOtp = btoa(otp); // Encoding the OTP in base64
                        window.location.href = routeUrl + '?request=' + encodedOtp;

                    });
                } else {
                    Swal.fire("Error!", "Invalid OTP!", "error");
                }
            },
            error: function(xhr, status, error) {
                console.error(xhr.responseText);
                Swal.fire("Error!", "An error occurred while checking the OTP.", "error");
            }
        });
    }

    function FetchLoanDetail() {
        var otp = $("#loan_number").val();
        if (otp == '') {
            Swal.fire("Error!", "OTP Required!", "error");
            return false;
        }
        var csrfToken = $('meta[name="csrf-token"]').attr('content');
        $.ajax({
            url: "{{ route('userlocation.otp.check') }}",
            type: 'POST',
            data: {
                _token: csrfToken,
                otp: otp

            },
            success: function(response) {
                console.log(response);
                if (response == true) {
                    Swal.fire({
                        title: "Success!",
                        text: "Otp Verify Successfully!",
                        icon: "success",
                        timer: 2000,
                        showConfirmButton: false
                    }).then(function() {
                        var routeUrl = "{{ route('userlocation') }}";

                        var encodedOtp = btoa(otp); // Encoding the OTP in base64
                        window.location.href = routeUrl + '?request=' + encodedOtp;

                    });
                } else {
                    Swal.fire("Error!", "Invalid OTP!", "error");
                }
            },
            error: function(xhr, status, error) {
                console.error(xhr.responseText);
                Swal.fire("Error!", "An error occurred while checking the OTP.", "error");
            }
        });
    }

    function CheckStatus() {
        let get_status = $("#status").val();
        if (get_status == 5) {
            $(".select_route_id").removeClass("d-none");
        } else {
            $(".select_route_id").addClass("d-none");
        }
    }
</script>
<script>
    function OpenAssignModal(current_user_id, lead_id, lead_create_user_id) {
        if (current_user_id) {

            $("#lead_create_user_id").val(lead_create_user_id);
            $("#current_user_id").val(current_user_id);
            $("#current_lead_id").val(lead_id);
        }
    }

    function AssignLead() {

        $(".assign_error").text('');
        $(".assign_success").text('');
        var current_user_id = $("#current_user_id").val();
        var assign_user_id = $("#selectOption").val();
        var lead_id = $("#current_lead_id").val();
        var lead_create_user_id = $("#lead_create_user_id").val();

        if (!assign_user_id) {
            $(".assign_error").text("Please Select Assign User");
            return false;
        }
        if (lead_create_user_id == assign_user_id) {
            $(".assign_error").text("Lead Already Assigned to This User");
            return false;
        }

        var csrfToken = $('meta[name="csrf-token"]').attr('content');
        $.ajax({
            url: "{{ route('assign.lead') }}",
            type: 'POST',
            data: {
                _token: csrfToken,
                current_user_id: current_user_id,
                assign_user_id: assign_user_id,
                lead_id: lead_id,
            },
            success: function(response) {
                $(".assign_error").text('');
                $(".assign_success").text("Lead Assigned Successfully");
                setTimeout(() => {
                    var routeUrl = "{{ route('enquiry') }}";
                    window.location.href = routeUrl;
                }, 2000);
            },
            error: function(xhr, status, error) {
                console.error(xhr.responseText);
                alert("An error occurred while assigning the lead.");
            }
        });
    }
</script>
</body>

</html>
