<#--
Licensed to the Apache Software Foundation (ASF) under one
or more contributor license agreements.  See the NOTICE file
distributed with this work for additional information
regarding copyright ownership.  The ASF licenses this file
to you under the Apache License, Version 2.0 (the
"License"); you may not use this file except in compliance
with the License.  You may obtain a copy of the License at

http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing,
software distributed under the License is distributed on an
"AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
KIND, either express or implied.  See the License for the
specific language governing permissions and limitations
under the License.
-->
<div class="panel panel-default">
    <div class="panel-heading">
        <h3 class="panel-title">
            收货地址
            <a class="btn btn-success btn-xs pull-right" data-toggle="collapse" href="#collapseExample" aria-expanded="false" aria-controls="collapseExample">新建地址</a>
        </h3>
    </div>
    <div class="panel-body">

        <form role="form">
            <div class="form-group">
                <label class="radio">
                    <input type="radio" data-toggle="radio" name="userplace" id="userplace1" value="option1" data-radiocheck-toggle="radio" required="" class="custom-radio"><span class="icons"><span class="icon-unchecked"></span><span class="icon-checked"></span></span>
                    地址1
                </label>
                <label class="radio">
                    <input type="radio" data-toggle="radio" name="userplace" id="userplace2" value="option1" data-radiocheck-toggle="radio" checked="" class="custom-radio"><span class="icons"><span class="icon-unchecked"></span><span class="icon-checked"></span></span>
                    地址2
                </label>
            </div>
        </form>

    </div>
</div>

<!-- 新建地址窗 -->
<div class="collapse" id="collapseExample">
    <div class="well">

        <form class="form-horizontal" role="form">
            <div class="form-group">
                <label for="inputEmail1" class="col-lg-2 control-label">收件人</label>
                <div class="col-lg-10">
                    <input type="email" class="form-control" id="inputEmail1" placeholder="Email">
                </div>
            </div>
            <div class="form-group">
                <label for="inputPassword1" class="col-lg-2 control-label">城市</label>
                <div class="col-lg-10">

                    <select class="col-lg-4">
                        <option selected="true">中国</option>
                        <option>美国</option>
                        <option>德国</option>
                        <option>法国</option>
                    </select>

                    <select class="col-lg-4">
                        <option>江苏</option>
                        <option>河北</option>
                        <option>河南</option>
                        <option>北京</option>
                    </select>

                    <select class="col-lg-4">
                        <option>常德</option>
                        <option>无锡</option>
                    </select>


                </div>
            </div>
            <div class="form-group">
                <label for="inputPassword1" class="col-lg-2 control-label">地址</label>
                <div class="col-lg-10">
                    <input type="email" class="form-control" id="inputEmail1" placeholder="Email">
                </div>
            </div>
            <div class="form-group">
                <label for="inputPassword1" class="col-lg-2 control-label">邮编</label>
                <div class="col-lg-10">
                    <input type="email" class="form-control" id="inputEmail1" placeholder="Email">
                </div>
            </div>
            <div class="form-group">
                <div class="col-lg-offset-2 col-lg-10">
                    <button type="submit" class="btn btn-default">新增</button>
                </div>
            </div>
        </form>

    </div>
</div>

<div class="panel panel-default">
    <div class="panel-heading">
        <h3 class="panel-title">送货方式</h3>
    </div>
    <div class="panel-body">

        <form role="form">
            <div class="form-group">
                <label class="radio">
                    <input type="radio" data-toggle="radio" name="userplace" id="userplace1" value="option1" data-radiocheck-toggle="radio" required="" class="custom-radio"><span class="icons"><span class="icon-unchecked"></span><span class="icon-checked"></span></span>
                    顺丰
                </label>
                <label class="radio">
                    <input type="radio" data-toggle="radio" name="userplace" id="userplace2" value="option1" data-radiocheck-toggle="radio" checked="" class="custom-radio"><span class="icons"><span class="icon-unchecked"></span><span class="icon-checked"></span></span>
                    韵达
                </label>
            </div>
        </form>

    </div>
</div>

<div class="panel panel-default">
    <div class="panel-heading">
        <h3 class="panel-title">支付方式</h3>
    </div>
    <div class="panel-body">

        <form role="form">
            <div class="form-group">
                <label class="radio">
                    <input type="radio" data-toggle="radio" name="userplace" id="userplace1" value="option1" data-radiocheck-toggle="radio" required="" class="custom-radio"><span class="icons"><span class="icon-unchecked"></span><span class="icon-checked"></span></span>
                    支付宝
                </label>
                <label class="radio">
                    <input type="radio" data-toggle="radio" name="userplace" id="userplace2" value="option1" data-radiocheck-toggle="radio" checked="" class="custom-radio"><span class="icons"><span class="icon-unchecked"></span><span class="icon-checked"></span></span>
                    银联
                </label>
            </div>
        </form>

    </div>
</div>
