{*
/*********************************************************************************
** The contents of this file are subject to the vtiger CRM Public License Version 1.0
 * ("License"); You may not use this file except in compliance with the License
 * The Original Code is:  vtiger CRM Open Source
 * The Initial Developer of the Original Code is vtiger.
 * Portions created by vtiger are Copyright (C) vtiger.
 * All Rights Reserved.
 *
 ********************************************************************************/
*}

<div id="defaultValuesElementsContainer" style="display:none;">
	{foreach key=_FIELD_NAME item=_FIELD_INFO from=$AVAILABLE_FIELDS}
	<span id="{$_FIELD_NAME}_defaultvalue_container" name="{$_FIELD_NAME}_defaultvalue">
		{assign var="_FIELD_TYPE" value=$_FIELD_INFO->getFieldDataType()}
		{if $_FIELD_TYPE eq 'picklist' || $_FIELD_TYPE eq 'multipicklist'}
			<select id="{$_FIELD_NAME}_defaultvalue" name="{$_FIELD_NAME}_defaultvalue" class="detailedViewTextBox">
			{foreach item=_PICKLIST_DETAILS from=$_FIELD_INFO->getPicklistDetails()}
				<option value="{$_PICKLIST_DETAILS.value}">{$_PICKLIST_DETAILS.label|@getTranslatedString:$FOR_MODULE}</option>
			{/foreach}
			</select>
		{elseif $_FIELD_TYPE eq 'integer'}
			<input type="text" id="{$_FIELD_NAME}_defaultvalue" name="{$_FIELD_NAME}_defaultvalue" class="detailedViewTextBox" value="0" />
		{elseif $_FIELD_TYPE eq 'owner' || $_FIELD_INFO->getUIType() eq '52'}
			<select id="{$_FIELD_NAME}_defaultvalue" name="{$_FIELD_NAME}_defaultvalue" class="detailedViewTextBox">
				<option value="">--{'LBL_NONE'|@getTranslatedString:$FOR_MODULE}--</option>
			{foreach key=_ID item=_NAME from=$USERS_LIST}
				<option value="{$_ID}">{$_NAME}</option>
			{/foreach}
			{if $_FIELD_INFO->getUIType() eq '53'}
				{foreach key=_ID item=_NAME from=$GROUPS_LIST}
				<option value="{$_ID}">{$_NAME}</option>
				{/foreach}
			{/if}
			</select>
		{elseif $_FIELD_TYPE eq 'date'}
			{* crmv@190519 *}
			<input type="text" id="{$_FIELD_NAME}_defaultvalue" name="{$_FIELD_NAME}_defaultvalue" class="detailedViewTextBox input-inline" value="" />
			<i class="vteicon md-link md-text" id="jscal_trigger_{$_FIELD_NAME}">event</i>
			<script type="text/javascript">
				(function() {ldelim}
					setupDatePicker('{$_FIELD_NAME}_defaultvalue', {ldelim}
						trigger: 'jscal_trigger_{$_FIELD_NAME}',
						date_format: "YYYY-MM-DD",
						language: "{$APP.LBL_JSCALENDAR_LANG}",
					{rdelim});
				{rdelim})();
			</script>
			{* crmv@190519e *}
		{elseif $_FIELD_TYPE eq 'datetime'}
			{* crmv@190519 *}
			<input type="text" id="{$_FIELD_NAME}_defaultvalue" name="{$_FIELD_NAME}_defaultvalue" class="detailedViewTextBox input-inline" value="" />
			<i class="vteicon md-link md-text" id="jscal_trigger_{$_FIELD_NAME}">event</i>
			<script type="text/javascript">
				(function() {ldelim}
					setupDatePicker('{$_FIELD_NAME}_defaultvalue', {ldelim}
						trigger: 'jscal_trigger_{$_FIELD_NAME}',
						date_format: "YYYY-MM-DD",
						language: "{$APP.LBL_JSCALENDAR_LANG}",
					{rdelim});
				{rdelim})();
			</script>
			{* crmv@190519e *}
		{elseif $_FIELD_TYPE eq 'boolean'}
			<input type="checkbox" id="{$_FIELD_NAME}_defaultvalue" name="{$_FIELD_NAME}_defaultvalue" />
		{elseif $_FIELD_TYPE neq 'reference'}
			<input type="text" id="{$_FIELD_NAME}_defaultvalue" name="{$_FIELD_NAME}_defaultvalue" class="detailedViewTextBox" />
		{/if}
	</span>
	{/foreach}
</div>
