<#import "parts/common.ftlh" as c>

<@c.page>
<div xmlns="http://www.w3.org/1999/html">User editor</div>
<form action="/user" method="post">
	<input type="text" name="username" value="${user.username}" class="form-control mb-2" />
	<#list roles as role>
		<div class="mb-2">
			<label><input type="checkbox" name="${role}" ${user.roles?seq_contains(role)?string("checked", "")} />${role}</label>
		</div>
	</#list>
	<input type="hidden" name="userId" value="${user.id}" />
	<input type="hidden" name="_csrf" value="${_csrf.token}" />
	<button type="submit" class="btn btn-primary">Save</button>
</form>
</@>