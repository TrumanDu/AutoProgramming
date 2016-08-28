<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/context/mytags.jsp"%>
<div class="portlet box green">
	<div class="portlet-title">
		<div class="caption">
			<i class="fa fa-gift"></i>表单配置
		</div>
  </div>
  <div class="portlet-body form">
  	<form id="dataSourceForm" class="form-horizontal form-bordered" action="/tableConfig/update" method="post">
  		<div class="form-group">
        <label class="col-md-2 control-label">表名:</label>
        <div class="col-md-3">
        	<div class="input-icon right">
	        	<i class="fa"></i>
	          <input type="text" class="form-control" name="tableName" 
	          	value="${tableConfig.tableName}" disabled required maxlength="200"/>
	        </div>
        </div>
        <label class="col-md-2 control-label">类名:</label>
        <div class="col-md-3">
        	<div class="input-icon right">
	        	<i class="fa"></i>
	          <input type="text" class="form-control" name="className" 
	          	value="${tableConfig.className}" required maxlength="200"/>
	        </div>
        </div>
      </div>
      <div class="form-group">
        <label class="col-md-2 control-label">显示多选框:</label>
        <div class="col-md-3">
        	<div class="input-icon right">
	        	<i class="fa"></i>
	        	<select class="form-control" name="isCheckbox" required>
	        		<option value="Y" <c:if test="${tableConfig.isCheckbox eq 'Y'}">selected</c:if>>是</option>
	        		<option value="N" <c:if test="${tableConfig.isCheckbox eq 'N'}">selected</c:if>>否</option>
	        	</select>
        	</div>
        </div>
        <label class="col-md-2 control-label">分页:</label>
        <div class="col-md-3">
        	<div class="input-icon right">
	        	<i class="fa"></i>
	        	<select class="form-control" name="isPage" required>
	        		<option value="Y" <c:if test="${tableConfig.isPage eq 'Y'}">selected</c:if>>是</option>
	        		<option value="N" <c:if test="${tableConfig.isPage eq 'N'}">selected</c:if>>否</option>
	        	</select>
        	</div>
        </div>
      </div>
      <div class="form-group">
        <label class="col-md-2 control-label">功能描述:</label>
        <div class="col-md-5">
        	<div class="input-icon right">
	        	<i class="fa"></i>
	          <input type="text" class="form-control" name="description" 
	          	value="${tableConfig.description}" required maxlength="200"/>
	        </div>
        </div>
      </div>
  		<div class="table-scrollable">
  		<table class="table table-striped table-hover table-center">
  			<tr>
  				<th>#</th>
  				<th>列名</th>
  				<th>列类型</th>
  				<th>长度</th>
  				<th>描述</th>
  				<th>属性名</th>
  				<th>属性类型</th>
  				<th>主键</th>
  				<th>可为空</th>
  				<th>排序</th>
  				<th>页面显示类型</th>
  				<th>是否查询</th>
  				<th>查询模式</th>
  				<th>查询类型</th>
  				<th>列表显示</th>
  				<th>表单显示</th>
  				<th>验证类型</th>
  				<th>顺序</th>
  			</tr>
  			<c:forEach items="${tableConfig.columns}" var="column" varStatus="vs">
  			<tr>
  				<td>${vs.count }<input type="hidden" name="columns[${vs.index}].id" value="${column.id}"/></td>
  				<td>${column.columnName}</td>
  				<td>${column.columnType}</td>
  				<td>${column.columnLength}</td>
  				<td>
  					<div style="width: 120px;" class="input-icon right">
	  					<i class="fa"></i>
	  					<input type="text" class="form-control" name="columns[${vs.index}].description" value="${column.description}" required/>
  					</div>
  				</td>
  				<td>
  					<div style="width: 100px;" class="input-icon right">
	  					<i class="fa"></i>
	  					<input type="text" class="form-control" name="columns[${vs.index}].fieldName" value="${column.fieldName}" required/>
  					</div>
  				</td>
  				<td>
  					<div style="width: 120px;">
  					<select class="form-control" name="columns[${vs.index}].fieldType">
  						<option value="String" <c:if test="${column.fieldType eq 'String'}">selected</c:if>>String</option>
  						<option value="Integer" <c:if test="${column.fieldType eq 'Integer'}">selected</c:if>>Integer</option>
  						<option value="Long" <c:if test="${column.fieldType eq 'Long'}">selected</c:if>>Long</option>
  						<option value="Float" <c:if test="${column.fieldType eq 'Float'}">selected</c:if>>Float</option>
  						<option value="Double" <c:if test="${column.fieldType eq 'Double'}">selected</c:if>>Double</option>
  						<option value="Date" <c:if test="${column.fieldType eq 'Date'}">selected</c:if>>Date</option>
  						<option value="BigDecimal" <c:if test="${column.fieldType eq 'BigDecimal'}">selected</c:if>>BigDecimal</option>
  					</select>
  					</div>
  				</td>
  				<td align="center">
  					<div style="width: 20px;">
  					<input type="hidden" name="columns[${vs.index}].isKey" value="${column.isKey}"/>
  					<input type="checkbox" class="form-control check" <c:if test="${column.isKey eq 'Y'}">checked</c:if>/>
  					</div>
  				</td>
  				<td align="center">
  					<div style="width: 20px;">
  					<input type="hidden" name="columns[${vs.index}].nullable" value="${column.nullable}"/>
  					<input type="checkbox" class="form-control check" <c:if test="${column.nullable eq 'Y'}">checked</c:if>/>
  					</div>
  				</td>
  				<td align="center">
  					<div style="width: 20px;">
  					<input type="hidden" name="columns[${vs.index}].sort" value="${column.sort}"/>
  					<input type="checkbox" class="form-control check" <c:if test="${column.sort eq 'Y'}">checked</c:if>/>
  					</div>
  				</td>
  				<td>
  					<div style="width: 100px;">
  					<select class="form-control" name="columns[${vs.index}].showType">
  						<option value="text" <c:if test="${column.showType eq 'text'}">selected</c:if>>文本框</option>
  						<option value="password" <c:if test="${column.showType eq 'password'}">selected</c:if>>密码</option>
  						<option value="radio" <c:if test="${column.showType eq 'radio'}">selected</c:if>>单选</option>
  						<option value="checkbox" <c:if test="${column.showType eq 'checkbox'}">selected</c:if>>多选</option>
  						<option value="date" <c:if test="${column.showType eq 'date'}">selected</c:if>>日期</option>
  						<option value="textarea" <c:if test="${column.showType eq 'textarea'}">selected</c:if>>文本域</option>
  						<option value="select" <c:if test="${column.showType eq 'select'}">selected</c:if>>下拉框</option>
  					</select>
  					</div>
  				</td>
  				<td align="center">
  					<div style="width: 20px;">
  					<input type="hidden" name="columns[${vs.index}].isQuery" value="${column.isQuery}"/>
  					<input type="checkbox" class="form-control check" <c:if test="${column.isQuery eq 'Y'}">checked</c:if>/>
  					</div>
  				</td>
  				<td>
  					<div style="width: 120px;">
  					<select class="form-control" name="columns[${vs.index}].queryModel">
  						<option value="single" <c:if test="${column.queryModel eq 'single'}">selected</c:if>>普通查询</option>
  						<option value="group" <c:if test="${column.queryModel eq 'group'}">selected</c:if>>范围查询</option>
  					</select>
  					</div>
  				</td>
  				<td>
  					<div style="width: 120px;">
  					<select class="form-control" name="columns[${vs.index}].queryType">
  						<option value="=" <c:if test="${column.queryType eq '='}">selected</c:if>>等于</option>
  						<option value="!=" <c:if test="${column.queryType eq '!='}">selected</c:if>>不等于</option>
  						<option value="like" <c:if test="${column.queryType eq 'like'}">selected</c:if>>模糊查询</option>
  						<option value="&gt;" <c:if test="${column.queryType eq '>'}">selected</c:if>>大于</option>
  						<option value="&gt;=" <c:if test="${column.queryType eq '>='}">selected</c:if>>大于等于</option>
  						<option value="&lt;" <c:if test="${column.queryType eq '<'}">selected</c:if>>小于</option>
  						<option value="&lt;=" <c:if test="${column.queryType eq '<='}">selected</c:if>>小于等于</option>
  						<option value="between" <c:if test="${column.queryType eq 'between'}">selected</c:if>>between</option>
  					</select>
  					</div>
  				</td>
  				<td align="center">
  					<div style="width: 20px;">
  					<input type="hidden" name="columns[${vs.index}].isShowList" value="${column.isShowList}"/>
  					<input type="checkbox" class="form-control check" <c:if test="${column.isShowList eq 'Y'}">checked</c:if>/>
  					</div>
  				</td>
  				<td align="center">
  					<div style="width: 20px;">
  					<input type="hidden" name="columns[${vs.index}].isShowForm" value="${column.isShowForm}"/>
  					<input type="checkbox" class="form-control check" <c:if test="${column.isShowForm eq 'Y'}">checked</c:if>/>
  					</div>
  				</td>
  				<td>
  					<div style="width: 80px;">
  					<input type="text" class="form-control" name="columns[${vs.index}].formValidType" value="${column.formValidType}"/>
  					</div>
  				</td>
  				<td>
  					<div style="width: 40px;">
  					<input type="text" class="form-control" name="columns[${vs.index}].orderNum" value="${column.orderNum}"/>
  					</div>
  				</td>
  			</tr>
  			</c:forEach>
  		</table>
  		</div>
      <div class="form-actions">
        <div class="col-md-9 col-md-offset-3">
          <button type="button" class="btn btn-primary" onclick="save(this)">
          	<spring:message code="btn.save"></spring:message>
          </button>
          <button type="reset" class="btn btn-default" onclick="cancel()">
          	<spring:message code="btn.return"></spring:message>
          </button>
        </div>
      </div>
      <input type="hidden" name="id" value="${tableConfig.id }">
  	</form>
  </div>
</div>
<script type="text/javascript">
	$(function(){
		$('#dataSourceForm').validate();
		
		$('.check').click(function(){
			if($(this).is(':checked')){
				$(this).prev().val('Y');
			}else{
				$(this).prev().val('N');
			}
		});
	});
</script>