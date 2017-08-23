package com.qutaole.sodirty.model.messages.response;

/**
 * 音乐消息
 * Created by hzhuchuanqi on 2017/8/23.
 */
public class MusicMessageResponse extends BaseMessageResponse {

    // 音乐
    private Music Music;

    public Music getMusic() {
        return Music;
    }

    public void setMusic(Music music) {
        Music = music;
    }
}
