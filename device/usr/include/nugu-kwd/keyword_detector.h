/*
 * Copyright (c) 2019 SK Telecom Co., Ltd. All rights reserved.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

#ifndef __KEYWORD_DETECTOR_H__
#define __KEYWORD_DETECTOR_H__

#ifdef __cplusplus
extern "C" {
#endif

int kwd_initialize(const char *model_net_file, const char *model_search_file);
int kwd_put_audio(short *buf, int buf_size);
void kwd_deinitialize();

int kwd_get_start_time();
int kwd_get_end_time();
int kwd_get_detection_time();
int kwd_get_start_margin();

float kwd_get_power();
float kwd_get_score();

#ifdef __cplusplus
}
#endif

#endif /* __KEYWORD_DETECTOR_H__ */
