<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<jsp:include page="header.jsp">
	<jsp:param value="groupManagement" name="appName" />
</jsp:include>


<div id="main_container">
	<h1 id="page_title">
		<spring:message code="word.personGroupPersonsByPerson" />
	</h1>
	<c:choose>
		<c:when test="${isPersonPKIncorrect.equals(true)}">
			<div class="error">
				<spring:message code="incorrect.personPK" />
			</div>
		</c:when>
		<c:otherwise>
			<nav id="context_menu">
				<a
					href="<c:url value="/person-group-person/new?person_id=${personId}" />"><spring:message
						code="word.newPersonGroupPerson" /></a>

			</nav>
			<div class="content">
				<c:choose>
					<c:when test="${empty personGroupPersons}">
						<div class="notification">
							<spring:message code="empty.personGroupPersons" />
						</div>
					</c:when>
					<c:otherwise>


						<!-- Pagination -->
						<c:url var="pag_link" value="${pageContext.request.requestURI}" />
						<jsp:include page="pagination.jsp"></jsp:include>



						<div class="table_container">
							<table class="buttons_included">
								<tr>
									<td></td>
									<td class="key"><spring:message
											code="word.personGroupName" /></td>
									<td><spring:message code="db.givenName" /></td>
									<td><spring:message code="db.familyName" /></td>
								</tr>
								<c:forEach items="${personGroupPersons}" var="item">
									<tr>
										<td>
											<form action="<c:url value="/person-group-person/manage" />"
												class="small" method="get">
												<input type="hidden" name="person_group_id"
													value="<c:out value="${item.id.personGroupId}"></c:out>" />
												<input type="hidden" name="person_id"
													value="<c:out value="${item.id.personId}"></c:out>" />
												<button title="" type="submit" class="button">
													<spring:message code="word.advance" />
												</button>
											</form>
										</td>
										<td class="dark_value"><c:out
												value="${item.id.personGroupId}"></c:out></td>
										<td><c:out value="${item.person.givenName}"></c:out></td>
										<td><c:out value="${item.person.familyName}"></c:out></td>
									</tr>
								</c:forEach>
							</table>
						</div>
						<!-- table_container -->

						<!-- Pagination -->
						<c:url var="pag_link" value="${pageContext.request.requestURI}" />
						<jsp:include page="pagination.jsp"></jsp:include>



					</c:otherwise>
				</c:choose>
			</div>
		</c:otherwise>
	</c:choose>
</div>

<jsp:include page="footer.jsp"></jsp:include>

