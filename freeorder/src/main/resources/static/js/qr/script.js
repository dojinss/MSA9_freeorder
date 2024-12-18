/**
 *  공지사항 다시보지않기 클릭시 닫기 이벤트
 */


/**
 * 상품목록
 */
// 이벤트 모달 팝업 열기
function eventModalOpen(noticesId) {
  const modal = document.getElementById("event-modal")
  const modalBody = document.getElementById("event-modal-body")
  
  let contentImg = document.createElement("img")
  contentImg.src = `/img?id=${noticesId}`
  modalBody.append(contentImg)
  modal.style.display = "flex"
}
// 이벤트 모달 팝업 닫기
function eventModalClose() {
  const modal = document.getElementById("event-modal")
  const modalBody = document.getElementById("event-modal-body")
  modalBody.innerHTML = ""
  modal.style.display = "none"
}


// 상품 수량 변경
let count = 1;
$(".quantity-plus").click(function () {
  count++
  let $quantity = $(this).siblings(".quantity")
  let max = $quantity.attr("max")
  $quantity.val(count)
  if (count >= max) {
    $quantity.val(max)
    count = max
  }
})
$(".quantity-minus").click(function () {
  count--
  let $quantity = $(this).siblings(".quantity")
  let min = $quantity.attr("min")
  $quantity.val(count)
  if (count <= min) {
    $quantity.val(min)
    count = min
  }
})


// 장바구니에 상품 추가
function cartInsert() {

  let id = $("#id").val()
  let quantity = $("#quantity").val()
  let optionsId = $("#optionsId").val()
  let itemList = new Array();
  $("input[name=itemList]").each(function () {
    let checked = $(this).is(":checked")
    itemList.push({
      "id": $(this).val(),
      "checked": checked
    })
  })
  let data = {
    id: id,
    quantity: quantity,
    option: {
      id: optionsId,
      itemList: itemList
    }
  }
  let sendData = JSON.stringify(data)
  console.log("장바구니 추가중..");

  $.ajax({
    url: "/qr/carts",
    data: sendData,
    contentType: "application/json",
    type: "post",
    success: function (response) {
      console.log("장바구니 추가완료.");
      console.log(response)
      if ($.trim(response) == "SUCCESS") {
        alert("추가 완료")
        location.href = "/qr/list"
      }
    },
    error: function (data, status, err) {
      console.log("에러");
      console.log(data);
      console.log(status);
      console.log(err);
    }
  })
}
// 장바구니 옵션 변경
function editCart() {
  let id = $("#id").val()
  let optionsId = $("#optionsId").val()
  let productsId = $("#productsId").val()
  let itemList = new Array();
  $("input[name=itemList]").each(function () {
    let checked = $(this).is(":checked")
    if (checked) {
      itemList.push({
        "optionItemsId": $(this).val(),
      })
    }
  })
  let data = {
    id: id,
    productsId: productsId,
    optionList : itemList
  }
  let sendData = JSON.stringify(data)
  console.log("장바구니 옵션 수정중..");
  console.log(sendData)
  $.ajax({
    url: "/qr/carts",
    data: sendData,
    contentType: "application/json",
    type: "put",
    success: function (response) {
      console.log(response)
      if ($.trim(response) == "SUCCESS") {
        console.log("장바구니 옵션 수정완료.");
        alert("수정 완료")
        location.reload()
      }
    },
    error: function (data, status, err) {
      console.log("에러");
      console.log(data);
      console.log(status);
      console.log(err);
    }
  })
}
// 장바구니에서 상품 제거
function cartDelete(id) {
  let url = '/qr/carts'
  let data = {
    id: id
  }
  if (confirm('삭제하시겠습니까?')) {
    $.ajax({
      url: url,
      data: data,
      type: 'delete',
      success: function (response) {
        if ($.trim(response) == 'SUCCESS') {
          location.reload()
        }

      }
    })
  }
}

// 장바구니 상품 전체 제거
function deleteAllCartItems() {
  if (!confirm("장바구니의 모든 항목을 삭제하시겠습니까?")) {
    return;
  }
  fetch('/qr/carts/deleteAll', {
    method: 'DELETE',
    headers: {
      'Content-Type': 'application/json'
    }
  })
    .then(response => {
      if (response.ok) {
        alert("장바구니가 비워졌습니다!");
        location.reload();
      } else {
        alert("장바구니 삭제 중 오류가 발생했습니다.");
      }
    })
    .catch(error => {
      console.error("Error:", error);
      alert("서버와 통신 중 문제가 발생했습니다.");
    });
}


// 장바구니 비었을 시 알람
function validateCart(event) {
  event.preventDefault();
  const cartItems = document.querySelectorAll(".cart-list .c-card");
  if (cartItems.length === 0) {
    alert("장바구니가 비어있습니다!");
    return false;
  } else {
    location.href = "/qr/pay/pay";
  }
}

/**
 *  MODAL
 */

// 모달 열기
function openModal(productsId) {
  const modal = document.getElementById('option-modal');
  modal.style.display = 'flex';
  fetch(`/qr/option/${productsId}`)
    .then(response => response.text())
    .then(html => {
      document.getElementById('modal-body').innerHTML = html;
      closeModalMapping()
    })
    .catch(error => console.error('Error loading modal content:', error));
}

// 모달 닫기
function closeModalMapping() {
  document.getElementById('close-modal').addEventListener('click', () => {
    const modal = document.getElementById('option-modal');
    modal.style.display = 'none';
  })
}