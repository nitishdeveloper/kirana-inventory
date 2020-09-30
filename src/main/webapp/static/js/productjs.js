/*---------------------ajax call for save product details------------------------------------*/
var baseURL = 'http://localhost:8080/kirana-inventory/product/';
var baseURL1 = 'http://localhost:8080/kirana-inventory/';
function saveProduct() {
	var productId = $('#productId').val();
	var productName = $('#productName').val();
	var brandName = $('#brandName').val();
	var quantity = $('#quantity').val();
	var categoryName = $('#categoryName').val();
	var marketPrice = $('#marketPrice').val();
	var actualPrice = $('#actualPrice').val();
	if (productId == "" || productName == "" || quantity == "" || marketPrice == "" || actualPrice == "") {
			alert("fields can't be empty");
		} else {
		var product = {
			productId : productId,
			productName : productName,
			brandName : brandName,
			quantity : quantity,
			categoryName : categoryName,
			marketPrice : marketPrice,
			actualPrice : actualPrice,
			status : 1
		};
		$.ajax({
			type : 'POST',
			url : baseURL + 'addproduct',
			data : JSON.stringify(product),
			contentType : "application/json",
			success : function(response) {
				if (response == "OK") {
					alert("new product has been added now...!!!");
					window.location = baseURL + 'productlist';
				}
			},
			error : function(response) {
				alert("something went wrong");
			}
		});
	}

}

function getProductDetails(entityId) {
	$
			.ajax({
				type : 'GET',
				url : baseURL + entityId,
				success : function(response) {
					var txt = '';
					txt += '<class="text-center" style="color: #757575;" class="form-horizontal">';
					txt += '<input type="hidden" class="form-control" id="entityId" value="'
							+ response.entityId + '" >';
					txt += '<div class="form-row mb-4"> <div class="col">';
					txt += '<input type="text" id="productId" class="form-control" value="'
							+ response.productId + '" placeholder="ProductId">';
					txt += '</div>';
					txt += '<div class="col">';
					txt += '<input type="text" id="productName" class="form-control" value="'
							+ response.productName
							+ '" placeholder="productName">';
					txt += '</div></div>';
					txt += '<div class="form-row mb-4"> <div class="col">';
					txt += '<input type="text" id="brandName" class="form-control" value="'
							+ response.brandName + '" placeholder="brandName">';
					txt += '</div>';
					txt += '<div class="col">';
					txt += '<input type="text" id="quantity" class="form-control" value="'
							+ response.quantity + '" placeholder="quantity" >';
					txt += '</div></div>';
					txt += '<div class="form-row mb-4"> <div class="col">';
					txt += '<input type="text" id="categoryName" class="form-control" value="'
							+ response.categoryName
							+ '" placeholder="categoryName">';
					txt += '</div>';
					txt += '<div class="col">';
					txt += '<input type="text" id="marketPrice" class="form-control" value="'
							+ response.marketPrice
							+ '" placeholder="marketPrice" >';
					txt += '</div></div>';
					txt += '<div class="form-row mb-4"> <div class="col">';
					txt += '<input type="text" id="actualPrice" class="form-control" value="'
							+ response.actualPrice
							+ '" placeholder="actualPrice">';
					txt += '</div>';
					txt += '<div class="col">';
					txt += '<input type="text" id="productName" class="form-control" value="'
							+ response.status + '" placeholder="status" >';
					txt += '</div></div>';
					txt += '<button class="btn btn-outline-indigo btn-rounded btn-block my-4 waves-effect z-depth-0" onclick="updateProduct()">update</button>';
					txt += '</form>';
					$("#productlist").html(txt);
				}
			});
}

function deleteProduct(entityId) {
	$.ajax({
		type : 'GET',
		url : baseURL + 'deleteproduct/' + entityId,
		success : function(response) {
			if (response == "productlist") {
				window.location = baseURL + response;
			}
		},
		error : function(response) {
			alert("something went wrong");
		}
	});
}

function updateProduct(entityId) {
	var entityId = $('#entityId').val();
	var productId = $('#productId').val();
	var productName = $('#productName').val();
	var brandName = $('#brandName').val();
	var quantity = $('#quantity').val();
	var categoryName = $('#categoryName').val();
	var marketPrice = $('#marketPrice').val();
	var actualPrice = $('#actualPrice').val();
	var status = $('#status').val();
	var product = {
		entityId:entityId,	
		productId : productId,
		productName : productName,
		brandName : brandName,
		quantity : quantity,
		categoryName : categoryName,
		marketPrice : marketPrice,
		actualPrice : actualPrice,
		status : 1
	};
	$.ajax({
		type : 'POST',
		url : baseURL + 'updateproduct',
		data : JSON.stringify(product),
		contentType : "application/json",
		success : function(response) {
			if (response == "productlist") {
				alert("product has been updated now...!!!");
				window.location = baseURL + response;
			}
		},
		error : function(response) {
			alert("something went wrong");
		}
	});
}

// file upload
$(function() {
	$('button[type=submit]').click(
			function(e) {
				e.preventDefault();
				$(this).prop('disabled', true);

				var form = document.forms[0];
				var formData = new FormData(form);

				var ajaxReq = $.ajax({
					url : baseURL1 + 'fileUpload',
					type : 'POST',
					data : formData,
					cache : false,
					contentType : false,
					processData : false,
					xhr : function() {
						var xhr = $.ajaxSettings.xhr();
						xhr.upload.onprogress = function(event) {
							var perc = Math
									.round((event.loaded / event.total) * 100);
							$('#progressBar').text(perc + '%');
							$('#progressBar').css('width', perc + '%');
						};
						return xhr;
					},
					beforeSend : function(xhr) {
						$('#alertMsg').text('');
						$('#progressBar').text('');
						$('#progressBar').css('width', '0%');
					}
				});

				ajaxReq.done(function(msg) {
					$('#alertMsg').text(msg);
					$('input[type=file]').val('');
					$('button[type=submit]').prop('disabled', false);
				});
				ajaxReq.fail(function(jqXHR) {
					$('#alertMsg').text(
							jqXHR.responseText + '(' + jqXHR.status + ' - '
									+ jqXHR.statusText + ')');
					$('button[type=submit]').prop('disabled', false);
				});
			});
});
