package com.qutaole.sodirty.model.messages.request;

/**
 * 音频消息
 * Created by hzhuchuanqi on 2017/8/23.
 */
public class VoiceMessageRequest extends BaseMessageRequest {

    // 媒体ID
    private String MediaId;
    // 语音格式
    private String Format;

    public String getMediaId() {
        return MediaId;
    }

    public void setMediaId(String mediaId) {
        MediaId = mediaId;
    }

    public String getFormat() {
        return Format;
    }

    public void setFormat(String format) {
        Format = format;
    }
}
