<#include "security.ftlh">
<#import "login.ftlh" as l>

<nav class="navbar sticky-top navbar-expand-lg navbar-dark bg-dark">
    <div class="container-fluid">
        <a class="navbar-brand" href="/">Notelux</a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                <li class="nav-item">
                    <a class="nav-link" href="/">Home</a>
                </li>
                <#if user??>
                    <li class="nav-item">
                        <a class="nav-link" href="/main">Messages</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="/user-messages/${currentUserId}">My Messages</a>
                    </li>
                </#if>
                <#if isAdmin>
                    <li class="nav-item">
                        <a class="nav-link" href="/user">User list</a>
                    </li>
                </#if>
                <#if user??>
                    <li class="nav-item">
                        <a class="nav-link" href="/user/profile">Profile</a>
                    </li>
                </#if>
            </ul>
            <div class="navbar-text me-2"><#if user??>${name}<#else>Please, log in</#if></div>
            <div>
                <form action="/logout" method="post">
                    <input type="hidden" name="_csrf" value="${_csrf.token}" />
                    <button type="submit" class="btn btn-primary"><#if user??>Sign Out<#else>Log in</#if></button>
                </form>
            </div>
        </div>
    </div>
</nav>