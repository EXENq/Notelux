<#include "security.ftlh">
<#import "pager.ftlh" as p>

<@p.pager url page />

<div class="row row-cols-1 row-cols-md-4 g-4" id="message-list">
    <#list page.content as message>
    <div class="col">
        <div class="card my-3" data-id="${message.id}">
            <div>
                <#if message.filename??>
                <img src="/img/${message.filename}" class="card-img-top" />
            </#if>
        </div>
        <div class="card-body">
            <h5 class="card-title">#${message.tag}</h5>
            <h6 class="card-subtitle mb-2 text-muted">
                Author: <a href="/user-messages/${message.author.id}">${message.authorName}</a>
            </h6>
            <p class="card-text">${message.text}</p>
        </div>
        <div class="card-footer text-muted container">
            <ul class="nav nav-pills">
                <li class="nav-item">
                    <a class="nav-link" href="/messages/${message.id}/like" style="text-decoration: none;">
                        <#if message.meLiked>
                            <i class="fas fa-heart"></i>
                        <#else>
                            <i class="far fa-heart"></i>
                        </#if>
                        ${message.likes}
                    </a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="/comment/${message.id}" class="col align-self-center" style="text-decoration: none;">
                        <i class="fas fa-comment-alt"></i>
                        ${message.commentsCount}
                    </a>
                </li>
                <li class="nav-item">
                    <#if message.author.id == currentUserId>
                        <a class="nav-link" href="/user-messages/${message.author.id}?message=${message.id}" class="col align-self-center">
                            <i class="fas fa-edit"></i>
                        </a>
                    </#if>
                </li>
                <li class="nav-item">
                    <#if isAdmin || message.author.id == currentUserId>
                        <a class="nav-link" href="/message-delete/${message.id}" class="col align-self-center">
                            <i class="fas fa-trash-alt"></i>
                        </a>
                    </#if>
                </li>
            </ul>
        </div>
    </div>
</div>
<#else>
<div>No messages</div>
</#list>
</div>
<@p.pager url page />