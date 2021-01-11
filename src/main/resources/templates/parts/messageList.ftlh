<#include "security.ftlh">
<#import "pager.ftlh" as p>

<@p.pager url page />

<div class="row row-cols-1 row-cols-md-5 g-4" id="message-list">
    <#list page.content as message>
    <div class="col">
        <div class="card h-100 my-3" data-id="${message.id}">
            <div>
                <#if message.filename??>
                <img src="/img/${message.filename}" class="card-img-top" />
            </#if>
        </div>
        <div class="card-body">
            <h5 class="card-title">#${message.tag}</h5>
            <p class="card-text">${message.text}</p>
        </div>
        <div class="card-footer text-muted">
            <a href="/user-messages/${message.author.id}">${message.authorName}</a>
            <#if message.author.id == currentUserId>
                <a href="/user-messages/${message.author.id}?message=${message.id}" class="btn btn-primary">
                    Edit
                </a>
            </#if>
        </div>
    </div>
</div>
<#else>
<div>No messages</div>
</#list>
</div>