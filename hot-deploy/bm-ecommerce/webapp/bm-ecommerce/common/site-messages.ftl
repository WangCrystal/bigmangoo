
<#assign errorMessage = requestAttributes._BM_ERROR_MESSAGE_?if_exists>

<#if errorMessage?has_content>
    <div class="alert alert-warning alert-danger text-center" role="alert">
        <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <p>
            ${(errorMessage)!}
        </p>
    </div>
</#if>
