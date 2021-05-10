<#import "parts/common.ftlh" as c>

<@c.page>
<h3>${userChannel.username}</h3>
<#if !isCurrentUser>
    <#if isSubscriber>
        <a class="btn btn-info" href="/user/unsubscribe/${userChannel.id}">Unsubscribe</a>
    <#else>
        <a class="btn btn-info" href="/user/subscribe/${userChannel.id}">Subscribe</a>
    </#if>
</#if>
<div class="container my-3">
    <div class="row align-items-center">
        <div class="col-sm-2">
            <div class="card text-center">
                <div class="card-body">
                    <h5 class="card-title">Subscriptions</h5>
                    <p class="card-text">
                        <a href="/user/subscriptions/${userChannel.id}/list">${subscriptionsCount}</a>
                    </p>
                </div>
            </div>
        </div>
        <div class="col-sm-2">
            <div class="card text-center">
                <div class="card-body">
                    <h5 class="card-title">Subscribers</h5>
                    <p class="card-text">
                        <a href="/user/subscribers/${userChannel.id}/list">${subscribersCount}</a>
                    </p>
                </div>
            </div>
        </div>
        <div class="col-sm-2">
            <div class="card text-center">
                <div class="card-body">
                    <h5 class="card-title">Posts</h5>
                    <p class="card-text">
                        ${messagesCount}
                    </p>
                </div>
            </div>
        </div>
    </div>
</div>
<#if isCurrentUser>
    <#include "parts/messageEdit.ftlh" />
</#if>

<#include "parts/messageList.ftlh" />
</@c.page>