<#import "parts/common.ftlh" as c>

<@c.page>
	<div class="input-group mb-3">
		<form method="get" action="/main">
			<div class="row">
				<div class="col">
					<input type="text" name="filter" class="form-control" placeholder="Search by tag" value=${filter?ifExists}>
				</div>
				<div class="col">
					<button type="submit" class="btn btn-primary">Search</button>
				</div>
			</div>
		</form>
	</div>
	<a class="btn btn-primary" data-bs-toggle="collapse" href="#collapseForm" role="button" aria-expanded="false" aria-controls="collapseExample">
		Add new message
	</a>
	<div class="collapse <#if message??>show</#if>" id="collapseForm">
		<div class="input-group mb-3">
			<form method="post" enctype="multipart/form-data">
				<input type="text" name="text" class="form-control mb-2 mt-2 <#if (errorsMap['textError'])??>is-invalid</#if>"
					   value="<#if message??>${message.text}</#if>" placeholder="Message">
				<#if (errorsMap['textError'])??>
					<div class="invalid-feedback">
						${errorsMap['textError']}
					</div>
				</#if>
				<input type="text" name="tag" class="form-control mb-2"
					   value="<#if message??>${message.tag}</#if>"placeholder="Tag">
				<#if (errorsMap['tagError'])??>
					<div class="invalid-feedback">
						${errorsMap['tagError']}
					</div>
				</#if>
				<label for="formFile" class="form-label">Image</label>
				<input type="file" name="file" class="form-control mb-2" id="formFile">
				<input type="hidden" name="_csrf" value="${_csrf.token}">
				<button type="submit" class="btn btn-primary">Send message</button>
			</form>
		</div>
	</div>
	<div class="row row-cols-1 row-cols-md-4 g-4">
	<#list messages as message>
		<div class="col">
		<div class="card h-100 my-3">
			<div >
				<#if message.filename??>
					<img src="/img/${message.filename}" class="card-img-top">
				</#if>
			</div>
			<div class="card-body">
				<h5 class="card-title">${message.tag}</h5>
				<p class="card-text">${message.text}</p>
			</div>
			<div class="card-footer text-muted">
				${message.authorName}
			</div>
		</div>
	</div>
	<#else>
		<div>No messages</div>
	</#list>
	</div>
</@>