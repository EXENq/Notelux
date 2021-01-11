<#import "parts/common.ftlh" as c>

<@c.page>
	<div class="input-group mb-3">
		<form method="get" action="/main">
			<div class="row">
				<div class="col">
					<input type="text" name="filter" class="form-control" placeholder="Search by tag" value="${filter?ifExists}" />
				</div>
				<div class="col">
					<button type="submit" class="btn btn-primary">Search</button>
				</div>
			</div>
		</form>
	</div>

	<#include "parts/messageEdit.ftlh" />

	<#include "parts/messageList.ftlh" />
</@>