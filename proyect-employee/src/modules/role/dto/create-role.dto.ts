import { ApiProperty, ApiPropertyOptional } from '@nestjs/swagger';
import { ArrayNotEmpty, ArrayUnique, IsArray, IsEnum, IsInt, IsNotEmpty, IsOptional, IsString, MaxLength, Min } from 'class-validator';

export class CreateRoleDto {
  @ApiProperty({
    nullable: false,
    type: 'string',
    maxLength: 40,
  })
  @IsString()
  @MaxLength(40)
  @IsNotEmpty()
  name: string;

  @ApiPropertyOptional({ isArray: true, type: () => Number })
  @IsInt({ each: true })
  @Min(1, { each: true })
  @IsArray()
  @ArrayNotEmpty()
  @ArrayUnique()
  @IsOptional()
  permitIds: number[];
}
