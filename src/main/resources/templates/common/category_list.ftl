<div class="banan-tr form">
    <input class="inp01s keypress" button="#sousuo" type="text" defvalue="请输入关键字……" id="seachkeywords" value="${searchKey!''}">
    <a>
		<span>
			<select class="" id="select">
				<option value="">不限栏目</option>
				<#if topCategorys??>
					<#list topCategorys as topCategory>
						<#if topCategory?? && topCategory.id gt 0 && topCategory.small_icon??>
							<option value="${topCategory.id}">${topCategory.name}</option>
						</#if>
					</#list>
				</#if>
			</select>
		</span>
    </a>
    <input class="inp02s" type="bottom" id="sousuo">
</div>