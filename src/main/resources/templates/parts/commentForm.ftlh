<a class="btn btn-primary my-2" href="/main"><i class="fas fa-arrow-left"></i> Back to messages list</a>
<a class="btn btn-primary" data-bs-toggle="collapse" href="#collapseCommentForm" role="button" aria-expanded="false" aria-controls="collapseExample">
    Write a comment
</a>
<div class="collapse <#if comment??>show</#if>" id="collapseCommentForm">
    <div class="input-group mb-3">
        <form method="post">
            <input type="text" name="text" class="form-control mb-2 mt-2<#if (errorsMap['textError'])??>is-invalid</#if>" value="<#if comment??>${comment.text}</#if>" placeholder="Comment Message" />
            <#if (errorsMap['textError'])??>
            <div class="invalid-feedback">
                ${errorsMap['textError']}
            </div>
        </#if>
    <input type="hidden" name="_csrf" value="${_csrf.token}" />
    <input type="hidden" name="id" value="<#if comment??>${comment.id}</#if>" />
    <button type="submit" class="btn btn-primary">Send comment</button>
    </form>
</div>

</div>