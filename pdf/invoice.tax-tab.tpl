{*
* 2007-2012 PrestaShop
*
* NOTICE OF LICENSE
*
* This source file is subject to the Academic Free License (AFL 3.0)
* that is bundled with this package in the file LICENSE.txt.
* It is also available through the world-wide-web at this URL:
* http://opensource.org/licenses/afl-3.0.php
* If you did not receive a copy of the license and are unable to
* obtain it through the world-wide-web, please send an email
* to license@prestashop.com so we can send you a copy immediately.
*
* DISCLAIMER
*
* Do not edit or add to this file if you wish to upgrade PrestaShop to newer
* versions in the future. If you wish to customize PrestaShop for your
* needs please refer to http://www.prestashop.com for more information.
*
*  @author PrestaShop SA <contact@prestashop.com>
*  @copyright  2007-2012 PrestaShop SA
*  @version  Release: $Revision: 6753 $
*  @license    http://opensource.org/licenses/afl-3.0.php  Academic Free License (AFL 3.0)
*  International Registered Trademark & Property of PrestaShop SA
*}
<!--  TAX DETAILS -->
<table style="width: 100%">
	<tr>
		<td style="width: 20%"></td>
		<td style="width: 80%">
			{if $tax_exempt}
				{l s='Exempt of VAT according section 259B of the General Tax Code.' pdf='true'}
			{else if (count($shipping_tax_breakdown) + count($product_tax_breakdown) == 0)}
					{l s='No tax' pdf='true'}
			{else}
			<table style="width: 70%" >
				<tr style="line-height:5px;">
					<td style="text-align: left; background-color: #4D4D4D; color: #FFF; padding-left: 10px; font-weight: bold; width: 30%">{l s='Tax Detail' pdf='true'}</td>
					<td style="text-align: right; background-color: #4D4D4D; color: #FFF; padding-left: 10px; font-weight: bold; width: 20%">{l s='Tax Rate' pdf='true'}</td>
					<td style="text-align: right; background-color: #4D4D4D; color: #FFF; padding-left: 10px; font-weight: bold; width: 20%">{l s='Total Tax Excl' pdf='true'}</td>
					<td style="text-align: right; background-color: #4D4D4D; color: #FFF; padding-left: 10px; font-weight: bold; width: 20%">{l s='Total Tax' pdf='true'}</td>
				</tr>			

				{foreach $product_tax_breakdown as $rate => $product_tax_infos}
				<tr style="line-height:6px;background-color:{cycle values='#FFF,#DDD'};">
				 <td style="width: 30%">{l s='Products' pdf='true'}</td>
				 <td style="width: 20%; text-align: right;">{$rate} %</td>
				 <td style="width: 20%; text-align: right;">
				{if !$use_one_after_another_method}
					 {displayPrice currency=$order->id_currency price=$product_tax_infos.total_price_tax_excl}
				{/if}
				 </td>
				 <td style="width: 20%; text-align: right;">{displayPrice currency=$order->id_currency price=$product_tax_infos.total_amount}</td>
				</tr>
				{/foreach}

				{foreach $shipping_tax_breakdown as $shipping_tax_infos}
				<tr style="line-height:6px;background-color:{cycle values='#FFF,#DDD'};">
				 <td style="width: 30%">{l s='Shipping' pdf='true'}</td>
				 <td style="width: 20%; text-align: right;">{$shipping_tax_infos.rate} %</td>
				 <td style="width: 20%; text-align: right;">{displayPrice currency=$order->id_currency price=$order_invoice->total_shipping_tax_excl}</td>
				 <td style="width: 20%; text-align: right;">{displayPrice currency=$order->id_currency price=$shipping_tax_infos.total_amount}</td>
				</tr>
				{/foreach}
			</table>
			{/if}
		</td>
	</tr>
</table>
<!--  / TAX DETAILS -->

