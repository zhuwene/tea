<?php

namespace App\Admin\Controllers;

use App\Models\Users;
use App\Models\UsersCapitals;
use Encore\Admin\Controllers\AdminController;
use Encore\Admin\Form;
use Encore\Admin\Grid;
use Encore\Admin\Show;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Encore\Admin\Admin;

class UsersCapitalsController extends AdminController
{
    /**
     * Title for current resource.
     *
     * @var string
     */
    protected $title = '资金明细';

    /**
     * Make a grid builder.
     *
     * @return Grid
     */
    protected function grid()
    {
        $grid = new Grid(new UsersCapitals());

        $grid->column('id', __('Id'));
        $grid->column('users.username', __('用户名称'));
        $grid->column('account', __('账号'));
        $grid->column('price', __('金额'));
        $grid->column('balance', __('余额'));
        $grid->column('type', __('类型'));
        $grid->column('created_at', __('创建时间'));
        $grid->column('updated_at', __('更新时间'));
//        $grid->users()->name();

        return $grid;
    }

    /**
     * Make a show builder.
     *
     * @param mixed $id
     * @return Show
     */
    protected function detail($id)
    {
        $show = new Show(UsersCapitals::findOrFail($id));

        $show->field('id', __('Id'));
        $show->field('users.username', __('用户账号'));
        $show->field('account', __('账号'));
        $show->field('price', __('金额'));
        $show->field('balance', __('余额'));
        $show->field('type', __('类型'));
        $show->field('created_at', __('创建时间'));
        $show->field('updated_at', __('更新时间'));

        return $show;
    }

    /**
     * Make a form builder.
     *
     * @return Form
     */
    protected function form()
    {
        $form = new Form(new UsersCapitals());
        
        $form->select('uid', __('用户账号'))->rules('required', [
            'required' => '用户账号不能为空',
        ])->options(
            Users::query()->pluck('username', 'id')
        )->load('account', '/admin/userAccount');
        $form->select('account', __('银行账号'))->rules('required', [
            'required' => '请选择银行账号',
        ]);
        $form->select('type', __('类型'))->options(['转入', '转出'])->rules('required', [
            'required' => '请选择类型',
        ]);
        $form->number('price', __('金额'))->rules('required', [
            'required' => '请填写金额',
        ]);
        $form->hidden('balance');
        
        // 保存前回调
        $form->saving(function (Form $form) {
            if($form->type) {
                Users::where('id', $form->uid)->decrement(
                    'assets', 
                    $form->price,
                    ['updated_at'=>date('Y-m-d H:i:s')]
                );
            } else {
                Users::where('id', $form->uid)->increment(
                    'assets', 
                    $form->price,
                    ['updated_at'=>date('Y-m-d H:i:s')]
                );
            }
            $users = Users::where('id', $form->uid)->select('assets', 'market_value')->first();
            $form->balance = $users->assets - $users->market_value;
        });
        return $form;
    }

    public function userAccount(Request $request)
    {
        $id = $request->get('q');
        $users   = users::query()->where('id', $id)->select('id', 'account')->first();
        $account = explode(',', $users->account);
        foreach ($account as $k => $acc) {
            $data[$k]['id']   = $acc;
            $data[$k]['text'] = $acc;
        }
        return $data;
    }
}
