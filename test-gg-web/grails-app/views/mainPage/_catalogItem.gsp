<g:if test="${item}">
	<td class="tdpict">
		<a href="${createLink(action:'catalog', params:[catItem:item.id])}">
			<img src="/images/cat/${item.code}.gif" alt="">
		</a>
	</td>
	<td>
		<a class="catItem catLink" href="${createLink(action:'catalog', params:[catItem:item.id])}">
			<strong>${item.name}</strong>
		</a>
	</td>
</g:if>