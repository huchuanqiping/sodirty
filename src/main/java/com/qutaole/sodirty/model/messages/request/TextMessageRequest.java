package com.qutaole.sodirty.model.messages.request;

/**
 * 文本消息
 * Created by hzhuchuanqi on 2017/8/23.
 */
public class TextMessageRequest extends BaseMessageRequest {
    // 消息内容
    private String Content;

    public String getContent() {
        return Content;
    }

    public void setContent(String content) {
        Content = content;
    }
}
