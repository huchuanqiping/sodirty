package com.qutaole.sodirty.model.messages.request;

/**
 * 图片消息
 * Created by hzhuchuanqi on 2017/8/23.
 */
public class ImageMessageRequest extends BaseMessageRequest {

    // 图片链接
    private String PicUrl;

    public String getPicUrl() {
        return PicUrl;
    }

    public void setPicUrl(String picUrl) {
        PicUrl = picUrl;
    }
}
