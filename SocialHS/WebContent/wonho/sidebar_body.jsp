<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<div class="row d-block m-0">
		<c:forEach var="listAll" items="${listAll }" varStatus="idx">
			<div class="accordion" id="accordionExample">
				<div class="card" style="text-align: center">
					<div class="card-header" id="heading${num[idx.index] }">
						<h5 class="mb-0">
							<button class="btn btn-light" type="button"
								name="${num[idx.index] }" data-toggle="collapse"
								data-target="#${num[idx.index] }" aria-expanded="false"
								aria-controls="collapseOne" onclick="check(this)"
								ondblclick="check2(this)" id="My${num[idx.index] }">
								${listAll.getL_Name() }</button>
						</h5>
					</div>

					<div id=${num[idx.index] } class="collapse"
						aria-labelledby="heading${num[idx.index] }" data-parent="#accordionExample">
						<div class="card-body border" id="me">
							<c:forEach var="listSubAll" items="${listSubAll }">
								<c:if test="${listSubAll.getL_idx() == listAll.getL_Idx() }">
									<button type="button"
										class="list-group-item list-group-item-action btn-block"
										style="border: none" onclick="location.href='SubLocationController?type=sub&location=${location }&l_idx=${listSubAll.getL_idx() }&sl_idx=${listSubAll.getSl_idx()}&cPage=1&cntPerPage=5'">
										${listSubAll.getSl_name() }</button>
								</c:if>
							</c:forEach>
						</div>
					</div>
				</div>
			</div>
		</c:forEach>
</div>
