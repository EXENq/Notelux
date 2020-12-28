<a class="btn btn-primary" data-bs-toggle="collapse" href="#collapseForm" role="button" aria-expanded="false" aria-controls="collapseExample">
    Message editor
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
    <input type="hidden" name="id" value="<#if message??>${message.id}</#if>">
    <button type="submit" class="btn btn-primary">Save message</button>
    </form>
</div>
</div>