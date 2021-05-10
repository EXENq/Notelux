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
                    <a class="nav-link" href="/"><i class="fas fa-home"></i> Home</a>
                </li>
                <#if user??>
                    <li class="nav-item">
                        <a class="nav-link" href="/main"><i class="fas fa-newspaper"></i> Main</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="/user-messages/${currentUserId}"><i class="fas fa-user-alt"></i> My profile</a>
                    </li>
                </#if>
                <#if isAdmin>
                    <li class="nav-item">
                        <a class="nav-link" href="/user"><i class="fas fa-users"></i> User list</a>
                    </li>
                </#if>
                <#if user??>
                    <li class="nav-item">
                        <a class="nav-link" href="/user/profile"><i class="fas fa-user-edit"></i> Edit Profile</a>
                    </li>
                    <li class="nav-item">
                    <a class="nav-link" href="/support"><i class="fas fa-question-circle"></i> Support and info</a>
                    </li>
                </#if>
                <li class="nav-item">
                    <div class="input-group">
                        <form method="get" action="/main">
                            <div class="row">
                                <div class="col-auto">
                                    <input type="text" name="filter" class="form-control" placeholder="Search by tag" value="${filter?ifExists}" />
                                </div>
                                <div class="col-auto">
                                    <button type="submit" class="btn btn-primary"><i class="fas fa-search"></i></button>
                                </div>
                            </div>
                        </form>
                    </div>
                </li>
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