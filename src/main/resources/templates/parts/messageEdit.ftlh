
<div class="text-white">What's new?</div>
        <form class="row gy-2 gx-3 align-items-center" method="post" enctype="multipart/form-data">
                <div class="col-auto">
                    <input type="text" name="text" class="form-control <#if (errorsMap['textError'])??>is-invalid</#if>" value="<#if message??>${message.text}</#if>" placeholder="Text" />
                    <#if (errorsMap['textError'])??>
                        <div class="invalid-feedback">
                            ${errorsMap['textError']}
                        </div>
                    </#if>
                </div>
                <div class="col-auto">
                    <input type="text" name="tag" class="form-control <#if (errorsMap['tagError'])??>is-invalid</#if>" value="<#if message??>${message.tag}</#if>" placeholder="Tag" />
                    <#if (errorsMap['tagError'])??>
                        <div class="invalid-feedback">
                            ${errorsMap['tagError']}
                        </div>
                    </#if>
                </div>
                <div class="col-auto">
                    <label class="btn btn-primary" for="formFile">
                        <input type="file" name="file" id="formFile" style="display:none"
                               onchange="$('#upload-file-info').text(this.files[0].name)" />
                        <i class="fas fa-image"></i>
                    </label>
                    <span class='label label-info' id="upload-file-info"></span>
                </div>


            <input type="hidden" name="_csrf" value="${_csrf.token}" />
            <input type="hidden" name="id" value="<#if message??>${message.id}<#else>-1</#if>" />
            <div class="col-auto">
                <button type="submit" class="btn btn-primary">Сreate post</button>
            </div>
        </form>
