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

#ifndef __ENDPOINT_DETECTOR_H__
#define __ENDPOINT_DETECTOR_H__

#ifdef __cplusplus
extern "C" {
#endif

typedef struct _epd_param {
	int sample_rate;
	int max_speech_duration;
	int time_out;
	int pause_length;
} EpdParam;

typedef enum {
	EPD_START_DETECTING = 0,
	EPD_START_DETECTED = 1,
	EPD_END_DETECTED = 2,
	EPD_END_DETECTING = 3,
	EPD_TIMEOUT = 4,
	EPD_MAXSPEECH = 5,
	EPD_END_CHECK = 6,
} EpdStatus;

int epd_client_start(const char *model_file, EpdParam param);
EpdStatus epd_client_run(char *out_data, int *out_size, short *data, int size);
int epd_client_get_speech_boundary(int *start_time, int *end_time);
int epd_client_save_speech_data(const char *path, const char *file);
int epd_client_release();

#ifdef __cplusplus
}
#endif

#endif /* __ENDPOINT_DETECTOR_H__ */
