/*---------------------ajax call for save product details------------------------------------*/
var baseURL = 'http://localhost:8080/kirana-inventory/product/';
var baseURL1 = 'http://localhost:8080/kirana-inventory/bulk';
function saveProduct() {
	var productId = $('#productId').val();
	var productName = $('#productName').val();
	var brandName = $('#brandName').val();
	var quantity = $('#quantity').val();
	var categoryName = $('#categoryName').val();
	var marketPrice = $('#marketPrice').val();
	var actualPrice = $('#actualPrice').val();
	var status = $('#status').val();

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
//					alert("new product has been added now...!!!");
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
		$.ajax({
				type : 'GET',
				url : baseURL + entityId,
				success : function(response) {
					var txt = '';
					txt += '<class="text-center" style="color: #757575;" class="form-horizontal">';
					txt += '<input type="hidden" class="form-control" id="entityId" value="'+ response.entityId + '" >';
					txt += '<div class="form-row mb-4"> <div class="col">';
					txt += '<input type="text" id="pId" class="form-control" value="'+ response.productId + '" placeholder="productId" disabled>';
					txt += '</div>';
					txt += '<div class="col">';
					txt += '<input type="text" id="pName" class="form-control" value="'+ response.productName+ '" placeholder="productName">';
					txt += '</div></div>';
					txt += '<div class="form-row mb-4"> <div class="col">';
					txt += '<input type="text" id="bName" class="form-control" value="'+ response.brandName + '" placeholder="brandName">';
					txt += '</div>';
					txt += '<div class="col">';
					txt += '<input type="text" id="qty" class="form-control" value="'+ response.quantity + '" placeholder="quantity" >';
					txt += '</div></div>';
					txt += '<div class="form-row mb-4"> <div class="col">';
					txt += '<input type="text" id="cName" class="form-control" value="'+ response.categoryName+ '" placeholder="categoryName">';
					txt += '</div>';
					txt += '<div class="col">';
					txt += '<input type="text" id="mPrice" class="form-control" value="'+ response.marketPrice+ '" placeholder="marketPrice" >';
					txt += '</div></div>';
					txt += '<div class="form-row mb-4"> <div class="col">';
					txt += '<input type="text" id="aPrice" class="form-control" value="'+ response.actualPrice+ '" placeholder="actualPrice">';
					txt += '</div>';
					txt += '<div class="col">';
					txt += '<input type="text" id="stat" class="form-control" value="'+ response.status + '" placeholder="status" >';
					txt += '</div></div>';
					txt += '<button class="btn btn-outline-indigo btn-rounded btn-block my-4 waves-effect z-depth-0" onclick="updateProduct()">update</button>';
					$("#productlist").html(txt);
//					$('input[type="text"],input[type="number"],textarea').addClass("textstyle");
//					$('input[type="text"],input[type="number"],textarea').prop('disabled', true);
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

function updateProduct() {
	var entityId = $('#entityId').val();
	var productId = $('#pId').val();
	var productName = $('#pName').val();
	var brandName = $('#bName').val();
	var quantity = $('#qty').val();
	var categoryName = $('#cName').val();
	var marketPrice = $('#mPrice').val();
	var actualPrice = $('#aPrice').val();
	var status = $('#stat').val();
	var product = {
		entityId:entityId,	
		productId : productId,
		productName : productName,
		brandName : brandName,
		quantity : quantity,
		categoryName : categoryName,
		marketPrice : marketPrice,
		actualPrice : actualPrice,
		status : status
	};
	$.ajax({
		type : 'POST',
		url : baseURL + 'updateproduct',
		data : JSON.stringify(product),
		contentType : "application/json",
		success : function(response) {
			if (response == "productlist") {
//				alert("product has been updated now...!!!");
				window.location = baseURL + response;
			}
		},
		error : function(response) {
			alert("something went wrong");
		}
	});
}



$(document).ready(function () {
    $('#submitButton').click(function () {
    	    $('#uploadForm').ajaxForm({
    	        target: '#outputImage',
    	        url : baseURL1 + 'upload',
				type : 'POST',
    	        beforeSubmit: function () {
    	        	  $("#outputImage").hide();
    	        	   if($("#uploadImage").val() == "") {
    	        		   $("#outputImage").show();
    	        		   $("#outputImage").html("<div class='error'>Choose a file to upload.</div>");
                    return false; 
                }
    	            $("#progressDivId").css("display", "block");
    	            var percentValue = '0%';

    	            $('#progressBar').width(percentValue);
    	            $('#percent').html(percentValue);
    	        },
    	        uploadProgress: function (event, position, total, percentComplete) {

    	            var percentValue = percentComplete + '%';
    	            $("#progressBar").animate({
    	                width: '' + percentValue + ''
    	            }, {
    	                duration: 5000,
    	                easing: "linear",
    	                step: function (x) {
                        percentText = Math.round(x * 100 / percentComplete);
    	                    $("#percent").text(percentText + "%");
                        if(percentText == "100") {
                        	   $("#outputImage").show();
                        }
    	                }
    	            });
    	        },
    	        error: function (response, status, e) {
    	            alert('Oops something went.');
    	        },
    	        
    	        complete: function (xhr) {
    	            if (xhr.responseText && xhr.responseText != "error")
    	            {
    	            	  $("#outputImage").html(xhr.responseText);
    	            }
    	            else{  
    	               	$("#outputImage").show();
        	            	$("#outputImage").html("<div class='error'>Problem in uploading file.</div>");
        	            	$("#progressBar").stop();
    	            }
    	        }
    	    });
    });
});
